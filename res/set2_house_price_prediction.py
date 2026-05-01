"""
Set 2 - Q2
House price prediction using square feet area
"""

import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LinearRegression


data = pd.read_csv("houseprice_pred.csv")

x = data[["sqft_living"]]
y = data["price"]

x_train, x_test, y_train, y_test = train_test_split(
    x, y, test_size=0.20, random_state=42
)

print("X_train:")
print(x_train)

print("\nX_test:")
print(x_test)

print("\ny_train:")
print(y_train)

print("\ny_test:")
print(y_test)

scaler = StandardScaler()
x_train_scaled = scaler.fit_transform(x_train)
x_test_scaled = scaler.transform(x_test)

print("\nScaled Training Data:")
print(x_train_scaled)

print("\nScaled Testing Data:")
print(x_test_scaled)

model = LinearRegression()
model.fit(x_train_scaled, y_train)

predicted_price = model.predict(x_test_scaled)

print("\nPredicted House Prices:")
print(predicted_price)

area = [[2000]]
area_scaled = scaler.transform(area)
result = model.predict(area_scaled)

print("\nPredicted price for 2000 square feet:", result[0])
