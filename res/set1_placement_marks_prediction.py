"""
Set 1 - Q2
Placement exam marks prediction using CGPA
"""

import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LinearRegression


data = pd.read_csv("placement_data.csv")

x = data[["cgpa"]]
y = data["placement_exam_marks"]

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

predicted_marks = model.predict(x_test_scaled)

print("\nPredicted Placement Exam Marks:")
print(predicted_marks)

cgpa = [[8.5]]
cgpa_scaled = scaler.transform(cgpa)
result = model.predict(cgpa_scaled)

print("\nPredicted marks for CGPA 8.5:", result[0])
