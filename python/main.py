from faker import Faker
import random
import json
from datetime import datetime, timedelta
import uuid

fake = Faker()

# Constants
MALAYSIAN_BANKS = ['Maybank', 'CIMB', 'HSBC', 'BSN', 'AmBank', 'Hong Leong', 'Bank Rakyat', 'RHB', 'Public Bank']
DIGITAL_WALLETS = ['Touch n Go eWallet', 'GrabPay', 'Boost', 'MAE', 'GoPayz', 'ShopeePay']
MERCHANT_CATEGORIES = ['Groceries', 'Entertainment', 'Shopping', 'Travel', 'Utilities', 'F&B', 'Healthcare',
                       'Education', 'Transportation', 'Insurance']
SUBSCRIPTION_SERVICES = ['Netflix', 'Spotify', 'YouTube Premium', 'iCloud', 'Microsoft 365', 'Gaming Subscriptions']
UTILITY_PROVIDERS = ['Tenaga Nasional', 'Air Selangor', 'Indah Water', 'Time Internet', 'Maxis', 'Unifi']
LOAN_TYPES = ['Personal Loan', 'Education Loan', 'PTPTN']
CREDIT_REJECTION_REASONS = ['No credit histor`y', 'Insufficient income', 'Short employment duration',
                            'High debt ratio', 'Unstable employment']
HOBBIES = ['Traveling', 'Fitness', 'Reading', 'Gaming', 'Cooking', 'Photography', 'Music', 'Sports']

def generate_payment_history(num_months):
    return [{
        'month': (datetime.now() - timedelta(days=30 * i)).strftime('%Y-%m'),
        'amount': round(random.uniform(50, 500), 2),
        'status': random.choice(['Paid', 'Pending', 'Late']) if random.random() < 0.1 else 'Paid'
    } for i in range(num_months)]

def generate_duitnow_transactions(num_transactions):
    return [{
        'transaction_date': (datetime.now() - timedelta(days=random.randint(1, 365))).strftime('%Y-%m-%d'),
        'transaction_amount': round(random.uniform(10, 500), 2),
        'merchant_name': fake.company(),
        'payment_method': random.choice(DIGITAL_WALLETS + MALAYSIAN_BANKS),
        'qr_type': 'DuitNow QR',
        'location': fake.city(),
        'status': 'Completed'
    } for _ in range(num_transactions)]

def generate_transaction_history(num_transactions, monthly_income):
    return [{
        'transaction_date': (datetime.now() - timedelta(days=random.randint(1, 365))).strftime('%Y-%m-%d'),
        'transaction_amount': round(random.uniform(-monthly_income * 0.3, monthly_income * 0.4), 2),
        'transaction_type': random.choice(['Debit', 'Credit']),
        'merchant_category': random.choice(MERCHANT_CATEGORIES),
        'transaction_description': fake.sentence(),
        'payment_method': random.choice(['DuitNow Transfer', 'DuitNow QR', 'Cash'])
    } for _ in range(num_transactions)]

def generate_bill_payment_history():
    return {
        'utility_bills': [{
            'provider': random.choice(UTILITY_PROVIDERS),
            'account_number': fake.random_number(digits=8),
            'monthly_amount': round(random.uniform(50, 300), 2),
            'payment_status': 'Paid' if random.random() < 0.9 else random.choice(['Pending', 'Overdue']),
            'payment_history': generate_payment_history(6)
        } for _ in range(random.randint(2, 4))],
        'rent_payments': {
            'amount': round(random.uniform(500, 2000), 2),
            'due_date': (datetime.now() + timedelta(days=random.randint(1, 30))).strftime('%Y-%m-%d'),
            'payment_status': 'Paid' if random.random() < 0.95 else 'Pending'
        },
        'mobile_bills': {
            'provider': random.choice(['Maxis', 'Celcom', 'Digi', 'UMobile']),
            'plan_details': f"RM{random.randint(30, 150)} Monthly Plan",
            'payment_history': generate_payment_history(6)
        }
    }

def generate_hobbies():
    return random.sample(HOBBIES, random.randint(1, 3))

def generate_subscriptions():
    return [{
        'service_name': random.choice(SUBSCRIPTION_SERVICES),
        'subscription_fee': round(random.uniform(10, 50), 2),
        'payment_status': random.choice(['Active', 'Inactive']),
        'usage_frequency': random.randint(1, 30)
    } for _ in range(random.randint(1, 3))]

def generate_seasonal_spending():
    seasons = ['Festivals', 'School Holidays', 'Sales Events']
    return [{
        'season': random.choice(seasons),
        'amount_spent': round(random.uniform(500, 2000), 2),
        'primary_category': random.choice(MERCHANT_CATEGORIES)
    } for _ in range(random.randint(1, 3))]


def calculate_risk_metrics(user_data):
    monthly_income = user_data['basic_information']['monthly_income']
    employment_duration = user_data['basic_information']['employment_duration']
    education_level = user_data['basic_information']['education_level']
    bill_payments = user_data['bill_payment_history']
    bank_accounts = user_data['bank_accounts']

    # Increase base score range for more variability
    base_score = 500 + random.randint(-100, 100)

    # Adjust income scoring
    income_score = min(100, (monthly_income / 15000) * 100)

    # Adjust employment scoring
    employment_score = min(100, employment_duration * 15)

    # Education scoring
    education_points = {'Diploma': 70, 'Bachelor': 85, 'Master': 100}
    education_score = education_points.get(education_level, 60)

    # Bill payment behavior scoring
    bill_score = 100
    late_count = sum(1 for bill in bill_payments['utility_bills']
                     for payment in bill['payment_history']
                     if payment['status'] == 'Late')
    bill_score = max(0, bill_score - (late_count * 20))

    # Bank balance health
    balance_score = sum(min(100, (account['average_daily_balance'] / monthly_income) * 50)
                        for account in bank_accounts) / len(bank_accounts)

    # Adjust weights for better distribution
    weights = {
        'income': 0.25,
        'employment': 0.20,
        'education': 0.15,
        'bill': 0.25,
        'balance': 0.15
    }

    # Calculate final score with more randomness
    final_score = (
        base_score +
        (income_score * weights['income']) +
        (employment_score * weights['employment']) +
        (education_score * weights['education']) +
        (bill_score * weights['bill']) +
        (balance_score * weights['balance']) +
        random.randint(-50, 50)  # Add more randomness
    )

    # Adjust thresholds for risk categories
    if final_score > 700:
        risk_category = 'Low'
    elif final_score > 600:
        risk_category = 'Medium'
    else:
        risk_category = 'High'

    return {
        'credit_score': int(final_score),
        'risk_category': risk_category,
        'payment_default_probability': round(max(0, min(1, (850 - final_score) / 850)), 2),
        'financial_stability_score': int((final_score - 300) / 5.5),
        'creditworthiness_rating': 'A+' if final_score > 800 else 'A' if final_score > 700 else 'B' if final_score > 600 else 'C' if final_score > 500 else 'D',
        'behavioral_score': int(bill_score),
        'employment_stability_score': int(employment_score)
    }

def generate_user_data(num_users):
    # Ensure balanced distribution of key factors
    income_ranges = [
        (2500, 5000),  # Lower income
        (5001, 8000),  # Middle income
        (8001, 12000),  # Upper middle income
        (12001, 15000)  # High income
    ]
    employment_ranges = [
        (0, 2),  # Fresh employees
        (3, 5),  # Early experience
        (6, 9)  # Experienced
    ]

    users = []
    for i in range(num_users):
        # Cycle through ranges to ensure even distribution
        income_range = income_ranges[i % len(income_ranges)]
        emp_range = employment_ranges[i % len(employment_ranges)]

        monthly_income = round(random.uniform(income_range[0], income_range[1]), 2)
        age = random.randint(21, 30)  # Strictly between 21 and 30
        employment_duration = random.randint(emp_range[0], emp_range[1])

        user = {
            'user_id': str(uuid.uuid4()),
            'basic_information': {
                'full_name': fake.name(),
                'age': age,
                'gender': random.choice(['Male', 'Female']),
                'employment_status': random.choice(['Employed', 'Fresh Graduate', 'Contract']),
                'occupation': fake.job(),
                'monthly_income': monthly_income,
                'education_level': random.choice(['Diploma', 'Bachelor', 'Master']),
                'residential_status': random.choice(['Rent', 'Family Home']),
                'marital_status': random.choice(['Single', 'Married']),
                'employment_duration': employment_duration,
                'industry': random.choice(['Technology', 'Finance', 'Healthcare', 'Education', 'Manufacturing']),
                'hobbies': generate_hobbies()
            },
            'bank_accounts': [{
                'bank_id': str(uuid.uuid4()),
                'bank_name': random.choice(MALAYSIAN_BANKS),
                'account_type': random.choice(['Savings', 'Current']),
                'account_balance': round(random.uniform(500, 15000), 2),
                'average_daily_balance': round(random.uniform(500, 10000), 2),
                'monthly_inflow': round(monthly_income * random.uniform(0.9, 1.1), 2),
                'monthly_outflow': round(monthly_income * random.uniform(0.6, 0.9), 2),
                'transaction_history': generate_transaction_history(random.randint(20, 50), monthly_income),
                'duitnow_qr_transactions': generate_duitnow_transactions(random.randint(5, 20))
            } for _ in range(random.randint(1, 2))],
            'digital_wallets': [{
                'wallet_provider': wallet,
                'wallet_id': str(uuid.uuid4()),
                'balance': round(random.uniform(10, 500), 2),
                'monthly_transactions': random.randint(5, 30),
                'average_transaction': round(random.uniform(10, 100), 2),
                'top_up_frequency': random.randint(1, 8),
                'duitnow_qr_usage': random.randint(3, 15)
            } for wallet in random.sample(DIGITAL_WALLETS, random.randint(2, 4))],
            'bill_payment_history': generate_bill_payment_history(),
            'subscriptions': generate_subscriptions(),
            'seasonal_spending': generate_seasonal_spending()
        }

        user['risk_assessment'] = calculate_risk_metrics(user)
        users.append(user)
    return users

# Generate data for 10 users and save as JSON
user_data = generate_user_data(500)
with open('user_data.json', 'w') as json_file:
    json.dump(user_data, json_file, indent=4)

print("Data generation completed.")
