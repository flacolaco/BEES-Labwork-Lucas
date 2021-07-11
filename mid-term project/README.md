# Classic Models BI Solution 🚙 ✈️ 🏍️ 🚚 🚋
Lucas Mata, July 2021

## Contents
1. Objective
2. Dataset
3. Business Model
4. Process
5. Dashboards

## 1. Objective

The objective of this project was to create a business intelligence tool targeted to two different audiences: C-level stakeholders (topline view) and Sales Representatives from the Commercial Team (detailed view). This tool would allow to answer some basic business questions such as, what, where, when and who is contributing to our growth.

## 2. Dataset

I took a fictitional database from MariaDB of a company called classic models. It contained 8 tables, sales across 27 different countries, 98 customers, 8 product categories, 109 products and 2.5 years of sales.


<img width="301" alt="Screenshot 2021-07-09 at 01 16 15" src="https://user-images.githubusercontent.com/83029831/125210106-db2f8700-e29d-11eb-97b5-1356c88f9235.png">

## 3. Business Model

Classic Models is a wholesaler that operates globally. Its main business activity is to buy miniature scaled replicas of classic cars, trucks, motorbikes, airplanes and trains and resell them to different retailers.

## 4. Process

1. First, I created a [Trello Board](https://trello.com/b/f8mCRPyB/mid-term-project) to plan the whole project.
2. Then, I wrote down a query in SQL that would allow me to extract all the different fields i would need to create both dashboards

<img width="949" alt="Screenshot 2021-07-09 at 00 47 14" src="https://user-images.githubusercontent.com/83029831/125210326-665d4c80-e29f-11eb-9ff3-20b61ca34843.png">

3. The next step was to export the query into a CSV file and connect to it with Tableau.
4. Once in Tableau, I followed the notes on my Trello Board to check what visuals i was going to create for each dashboard.
5. At this stage, I had to do a bit of feature engineering by creating new calculated fields such as Gross Profit, Net Revenues TY and LY, Fixed NR's and Gross Profit, etc.
6. Finally, once all visuals had been created I proceeded to add them into two separate views.

## 5. Dashboards

The first dashboard, directed to the Top Management of the company, would provide with a [Topline View](https://public.tableau.com/app/profile/lucas7303/viz/ClassicModelsBITool/TOPLINEVIEW) of what was happening in the business in terms of Net Revenues and Gross Profit.

It contains the following information:

+ Full year Net Revenues (NR) and Gross Profit (GP) for 2004 and vs LY
+ NR and GP monthly evolution for 2004 and 2003
+ NR by Customer Region for 2004 and 2003
+ NR by Subsidiary for 2004 and 2003
+ NR by Customer Country for 2004

... and functionality:

+ Month selection filter on the top right corner to select one or several months as the time period.
+ Tooltips with extra detail, mainly NR, GP and Mix of Business (MoB)
+ Most visuals (excluding KPI cards at the top) could be used as filters

The second dashboard, directed to Sales Representatives of the Commercial Team, would provide with a much more [Detailed View](https://public.tableau.com/app/profile/lucas7303/viz/ClassicModelsBITool/DETAILEDVIEW) of the business's performance. With multiple filters across the top, the idea of this dashboard was to be able to get to the bottom of what is driving the company's NR as well as allowing the different members of the Commercial Team to gain insight into their respective areas.

In terms of visuals, it contains:

+ Sales by country for 2004
+ Sales by product category for both 2004 and 2003
+ Detailed tables of sales by Customer and Product.

Regarding functionality, this view has:

+ Multiple filters across the top: Month Selection, Customer Region and Country, Customer Name and Employee Name.
+ Tooltips with extra details, mainly NR, GP and MoB.
+ All visuals can be used as filters

In case you have any questions, please contact me on [linkedin](https://www.linkedin.com/in/lucas-mata-vidosa-a53002ab/).

Thanks for reading!

Lucas




