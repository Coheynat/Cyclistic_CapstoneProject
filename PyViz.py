

import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# Read the CSV file into a pandas DataFrame
df = pd.read_csv('/kaggle/input/cyclistic-bike-share/202203-divvy-tripdata.csv')

# Use Seaborn to create a countplot of rideable types
sns.countplot(data=df, x='rideable_type')

# Set plot labels and title
plt.xlabel('Rideable Type')
plt.ylabel('Count')
plt.title('Distribution of Rideable Types')

# Rotate x-axis labels for better readability (optional)
plt.xticks(rotation=45)

# Display the plot
plt.show()

# Get the count of each rideable type
rideable_type_counts = df['rideable_type'].value_counts()

# Define custom colors for the pie chart
custom_colors = ['#ff9999', '#66b3ff', '#99ff99']  # Add more colors if needed

# Create a pie chart with custom colors
plt.figure(figsize=(8, 6))  # Optional: Set the figure size
plt.pie(rideable_type_counts, labels=rideable_type_counts.index, autopct='%1.1f%%', startangle=140, colors=custom_colors)

# Set plot title
plt.title('Distribution of Rideable Types')

# Display the plot
plt.axis('equal')  # Equal aspect ratio ensures that the pie chart is circular.
plt.show()





