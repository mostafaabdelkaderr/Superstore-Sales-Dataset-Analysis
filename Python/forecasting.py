import pandas as pd
from google.colab import files
Data = files.upload()
  
import pandas as pd
df = pd.read_csv('/content/Superstore Sales Dataset.csv')
print(df.head())

df['Order Date'] = pd.to_datetime(df['Order Date'], format='%d/%m/%Y')
import pandas as pd
from statsmodels.tsa.holtwinters import ExponentialSmoothing
import matplotlib.pyplot as plt

df['Order Date'] = pd.to_datetime(df['Order Date'])


category_name = 'Technology'
df_category = df[df['Category'] == category_name]

df_monthly_sales = df_category.groupby(pd.Grouper(key='Order Date', freq='M')).sum()['Sales']


if len(df_monthly_sales) >= 24:
    model = ExponentialSmoothing(df_monthly_sales, trend='add', seasonal='add', seasonal_periods=12).fit()
    forecast = model.forecast(steps=12)
else:
    print("Not enough data for seasonal modeling.")
    forecast = None  

plt.figure(figsize=(10, 6))
plt.plot(df_monthly_sales, label='Actual sales', marker='o')


if forecast is not None:
    plt.plot(forecast, label='Expected sales', marker='o', linestyle='--', color='red')
else:
    print("Cannot plot forecast due to insufficient data.")

plt.title(f'Sales forecast for the  {category_name}')
plt.xlabel('Date')
plt.ylabel('Sales')
plt.legend()
plt.show()

print(df.columns)
