import json
import csv
import os

# Load the JSON data
with open('user_data.json', 'r') as f:
    user_data = json.load(f)

# Create output folder for CSV files
output_folder = "csv_output"
os.makedirs(output_folder, exist_ok=True)


# Write a CSV file for a specific table
def write_csv(filename, fieldnames, rows):
    with open(os.path.join(output_folder, filename), 'w', newline='', encoding='utf-8') as csvfile:
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)


# Process the data
basic_info_rows = []
bank_account_rows = []
digital_wallet_rows = []
bill_payment_rows = []
utility_bill_rows = []
rent_payment_rows = []
mobile_bill_rows = []
risk_assessment_rows = []

for user in user_data:
    user_id = user['user_id']
    # Basic Information
    basic_info = user['basic_information']
    basic_info['user_id'] = user_id
    basic_info_rows.append(basic_info)

    # Bank Accounts
    for account in user['bank_accounts']:
        account['user_id'] = user_id
        bank_account_rows.append(account)

    # Digital Wallets
    for wallet in user['digital_wallets']:
        wallet['user_id'] = user_id
        digital_wallet_rows.append(wallet)

    # Bill Payment History
    bill_payment_history = user['bill_payment_history']
    for utility_bill in bill_payment_history['utility_bills']:
        utility_bill['user_id'] = user_id
        utility_bill['payment_history'] = json.dumps(utility_bill.pop('payment_history'))  # Store as JSON string
        utility_bill_rows.append(utility_bill)

    rent_payment = bill_payment_history['rent_payments']
    rent_payment['user_id'] = user_id
    rent_payment_rows.append(rent_payment)

    mobile_bill = bill_payment_history['mobile_bills']
    mobile_bill['user_id'] = user_id
    mobile_bill['payment_history'] = json.dumps(mobile_bill.pop('payment_history'))  # Store as JSON string
    mobile_bill_rows.append(mobile_bill)

    # Risk Assessment
    risk_assessment = user['risk_assessment']
    risk_assessment['user_id'] = user_id
    risk_assessment_rows.append(risk_assessment)

# Write CSV files
write_csv("basic_information.csv", basic_info_rows[0].keys(), basic_info_rows)
write_csv("bank_accounts.csv", bank_account_rows[0].keys(), bank_account_rows)
write_csv("digital_wallets.csv", digital_wallet_rows[0].keys(), digital_wallet_rows)
write_csv("utility_bills.csv", utility_bill_rows[0].keys(), utility_bill_rows)
write_csv("rent_payments.csv", rent_payment_rows[0].keys(), rent_payment_rows)
write_csv("mobile_bills.csv", mobile_bill_rows[0].keys(), mobile_bill_rows)
write_csv("risk_assessment.csv", risk_assessment_rows[0].keys(), risk_assessment_rows)

print(f"CSV files generated in the '{output_folder}' folder.")
