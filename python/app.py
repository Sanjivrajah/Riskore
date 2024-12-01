from flask import Flask, request, jsonify
from flask_cors import CORS
import pandas as pd
import joblib
import mask

app = Flask(__name__)
CORS(app)

# Load saved model and preprocessors
model = joblib.load('risk_assessment_model.joblib')
encoders = joblib.load('label_encoders.joblib')
scaler = joblib.load('scaler.joblib')

# Define your feature columns
categorical_columns = [
    'gender', 'employment_status', 'occupation', 'education_level',
    'residential_status', 'marital_status', 'industry', 'hobbies',
    'rent_status'
]

numerical_columns = [
    'age', 'monthly_income', 'employment_duration', 'num_accounts',
    'total_account_balance', 'avg_daily_balance', 'total_monthly_inflow',
    'total_monthly_outflow', 'num_wallets', 'total_wallet_balance',
    'avg_wallet_transaction', 'num_utility_bills', 'avg_utility_amount',
    'overdue_bills', 'rent_amount', 'monthly_plan_cost', 'credit_score'
]


@app.route('/predict', methods=['POST'])
def predict():
    try:
        # Get data from request
        data = request.get_json()

        # Create DataFrame from input data
        input_df = pd.DataFrame([data])

        # Preprocess categorical features
        for column in categorical_columns:
            if column in input_df.columns:
                # Get the known classes for this encoder
                known_categories = set(encoders[column].classes_)

                # Handle unknown categories
                input_df[column] = input_df[column].apply(
                    lambda x: x if x in known_categories else encoders[column].classes_[0]
                )

                # Now transform
                input_df[column] = encoders[column].transform(
                    input_df[column].astype(str)
                )

        # Rest of your code remains the same
        input_df[numerical_columns] = scaler.transform(
            input_df[numerical_columns]
        )

        features = input_df.drop(['full_name', 'user_id'], axis=1, errors='ignore')

        prediction = model.predict(features)
        prediction_proba = model.predict_proba(features)

        risk_category = encoders['risk_category'].inverse_transform(prediction)[0]

        return jsonify({
            'risk_category': risk_category,
            'confidence': float(max(prediction_proba[0])),
            'status': 'success'
        })

    except Exception as e:
        return jsonify({
            'error': str(e),
            'status': 'error'
        }), 400

if __name__ == '__main__':
    app.run(debug=True)
    # masker = AdvancedDataMasker()


