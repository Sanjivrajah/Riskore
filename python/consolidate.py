import pandas as pd
import os

# Load CSV files
output_folder = "csv_output"
basic_info = pd.read_csv(os.path.join(output_folder, "basic_information.csv"))
bank_accounts = pd.read_csv(os.path.join(output_folder, "bank_accounts.csv"))
digital_wallets = pd.read_csv(os.path.join(output_folder, "digital_wallets.csv"))
utility_bills = pd.read_csv(os.path.join(output_folder, "utility_bills.csv"))
rent_payments = pd.read_csv(os.path.join(output_folder, "rent_payments.csv"))
mobile_bills = pd.read_csv(os.path.join(output_folder, "mobile_bills.csv"))
risk_assessment = pd.read_csv(os.path.join(output_folder, "risk_assessment.csv"))

# Aggregating features
# Bank Accounts: Aggregate by user_id
bank_features = bank_accounts.groupby('user_id').agg(
    num_accounts=('bank_id', 'count'),
    total_account_balance=('account_balance', 'sum'),
    avg_daily_balance=('average_daily_balance', 'mean'),
    total_monthly_inflow=('monthly_inflow', 'sum'),
    total_monthly_outflow=('monthly_outflow', 'sum')
).reset_index()

# Digital Wallets: Aggregate by user_id
wallet_features = digital_wallets.groupby('user_id').agg(
    num_wallets=('wallet_provider', 'count'),
    total_wallet_balance=('balance', 'sum'),
    avg_wallet_transaction=('average_transaction', 'mean')
).reset_index()

# Utility Bills: Aggregate by user_id
utility_features = utility_bills.groupby('user_id').agg(
    num_utility_bills=('provider', 'count'),
    avg_utility_amount=('monthly_amount', 'mean'),
    overdue_bills=('payment_status', lambda x: (x == 'Overdue').sum())
).reset_index()

# Rent Payments: Keep relevant fields
rent_features = rent_payments[['user_id', 'amount', 'payment_status']].rename(
    columns={'amount': 'rent_amount', 'payment_status': 'rent_status'}
)

# Mobile Bills: Keep relevant fields
mobile_features = mobile_bills[['user_id', 'plan_details']].copy()
mobile_features['monthly_plan_cost'] = mobile_features['plan_details'].str.extract(r'RM(\d+)').astype(float)
mobile_features.drop(columns=['plan_details'], inplace=True)

# Merge datasets
consolidated = basic_info.merge(bank_features, on='user_id', how='left') \
                         .merge(wallet_features, on='user_id', how='left') \
                         .merge(utility_features, on='user_id', how='left') \
                         .merge(rent_features, on='user_id', how='left') \
                         .merge(mobile_features, on='user_id', how='left') \
                         .merge(risk_assessment[['user_id', 'credit_score', 'risk_category']], on='user_id', how='left')

# Save consolidated dataset to CSV
consolidated.to_csv(os.path.join(output_folder, "consolidated_dataset.csv"), index=False)

print("Consolidated dataset saved as 'consolidated_dataset.csv'")
