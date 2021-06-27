# Logistic Regression - Bank Case Study 🏦 💶 🤑
by [Lucas Mata](https://www.linkedin.com/in/lucas-mata-vidosa-a53002ab/), June 2021

![bank_image](https://user-images.githubusercontent.com/83029831/123551624-e4373900-d772-11eb-9215-04b878666117.jpeg)

## ☑️  Objective:

**Predict** how likely it would be for a **new customer** to fall within one of the two pre-defined **statuses**:

- **Status A:** "Good customers" - **LOW risk** of churn
- **Status B:** "Bad customers" - **HIGH risk** of churn

## 🔁  Process: 

1. **Connect to SQL** using Juypyter Notebook
2. Execute a **Query** to obtain the **relevant information** for our model:

   - Status
   - Loan amount
   - Number of transactions
   - Age of account
   - Unemployment rates (95' and 96')
   - Crime rates (95' and 96')
   - Ratio of amount paid back
   - Birthday

3. **Perform EDA** - Exploratory Data Analysis*
4. **Apply, Train** and **Test** the model*

`*` *For more information on steps 3 and 4, please check the detailed [Jupyter Notebook](https://github.com/flacolaco/BEES-Labwork-Lucas/blob/main/jupyternotebooks/Logistic%20Regression/bank_outline.ipynb)*

## 📚 Key Learnings:

Our Model has an **ACCURACY** of **78.17%** in predicting the status of a new customer. 
**HOWEVER** our data was highly inbalanced since we didnt have enough cases of "B" status to feed our model. 
We **SHOULD NOT** be using our model to **MAKE ANY BUSINESS DECISIONS** since it is not capable of predicting "Bad Customers".

<img width="346" alt="Screenshot 2021-06-27 at 18 02 29" src="https://user-images.githubusercontent.com/83029831/123552811-375fba80-d778-11eb-97dd-564e62574e5e.png">

*The confusion matrix above shows, from left to right, the predicted number of True A's, False A´s, False B´s and True B's from a sample of 70 customers.*

## 👣 Next Steps:

Our model proved to not be good enough to be used by the bank... Nevertheless, there are several things we could do to improve it´s accuracy!

1. Get new data points
   - Either External data
   - Or Internal data *i.e. extracting gender from birthdate*
2. Apply feature engineering to our existing data
3. Drop highly correlated fields
4. "Play" with the % of data used for testing and training
5. Apply SMOTE and TOMEK LINKS methods
6. Keep iterating

**Thank you for reading** - Please reach out if you have any further questions.

Lucas 🤓
