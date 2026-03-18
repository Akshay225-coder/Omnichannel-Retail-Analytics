import pandas as pd

sales = pd.read_csv("sales_data.csv", encoding='latin1')

# Inspect data
sales.head()
sales.info()

# Missing values
sales.isnull().sum()
print(sales.head)

# Remove duplicates
sales.drop_duplicates(inplace=True)
print(sales.describe())


# Convert date format
sales['order_date'] = pd.to_datetime(sales['order_date'], errors='coerce')
print(sales.info())

# Create revenue column
sales['revenue'] = sales['quantity'] * sales['price']
print(sales.head())

# Extract additional fields
sales['year'] = sales['order_date'].dt.year
sales['month'] = sales['order_date'].dt.month
sales['day'] = sales['order_date'].dt.day

# Save cleaned data
sales.to_csv("clean_sales_data.csv", index=False)
