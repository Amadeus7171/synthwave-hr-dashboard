import streamlit as st
import pandas as pd
import pyodbc

# Set up the page
st.set_page_config(page_title="🕶️ SynthWave HR Dashboard", layout="centered")
st.title("🎛️ SynthWave HR Insights")

# Connect to DB
conn = pyodbc.connect('DRIVER={SQL Server};SERVER=localhost;DATABASE=synthwave_db;Trusted_Connection=yes;')

# Pull employee salary data
query = "SELECT * FROM EmployeeSalary"
df = pd.read_sql(query, conn)

# Generate Salary Tiers
df['SalaryTier'] = df['Salary'].apply(
    lambda x: 'Junior' if x < 50000 else 'Mid-Level' if x <= 65000 else 'Senior'
)

# Sidebar filter
tier_filter = st.sidebar.multiselect("Filter by Salary Tier", df['SalaryTier'].unique(), default=df['SalaryTier'].unique())
filtered_df = df[df['SalaryTier'].isin(tier_filter)]

# Show Bar Chart
st.subheader("📊 Salary Tier Distribution")
st.bar_chart(filtered_df['SalaryTier'].value_counts())

# Show Raw Data
st.subheader("🧾 Salary Data")
st.dataframe(filtered_df)

import streamlit as st

st.set_page_config(page_title="Synthwave HR Dashboard", layout="wide")
st.title("🌈 Synthwave HR Dashboard")

st.write("Welcome to your pastel-powered data experience.")

