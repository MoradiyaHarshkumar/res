import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler

data = pd.read_csv("dataset4.csv")

target_column = data.columns[-1]
x = data.drop(target_column, axis=1)
y = data[target_column]

x = pd.get_dummies(x)

x_train, x_test, y_train, y_test = train_test_split(
    x, y, test_size=0.20, random_state=42
)

scaler = StandardScaler()
x_train_scaled = scaler.fit_transform(x_train)
x_test_scaled = scaler.transform(x_test)

print("Scaled Training Data:")
print(x_train_scaled)

print("\nScaled Testing Data:")
print(x_test_scaled)
