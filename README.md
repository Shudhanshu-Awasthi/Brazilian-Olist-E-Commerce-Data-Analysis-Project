Olist — E-Commerce Data Analysis         
Raw Data Sets Kaggle Link:-https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

Author: Shudhanshu Awasthi  
Contact:- https://www.linkedin.com/in/shudhanshu-awasthi

Overview:-
A concise analysis of the Olist marketplace to identify revenue drivers, regional performance, payment mix, category performance, seller concentration and customer retention. Analysis is reproducible via the provided SQL and Excel files.

About Olist:-
Olist is a Brazilian e-commerce marketplace that helps small and medium sellers reach large online marketplaces by providing listing, order routing and logistics integration services. 

The dataset includes:- orders, order_items, payments, reviews, products, sellers, customers ,geolocation,product category name translation.

Tools Used:-
MySQL for schema, data import and queries. Excel for cleaning (Power Query), charts and interpretation. MS Word for the written report.

Work completed:-
1. Cleaned raw CSVs and imported them into a normalized MySQL schema. Wrote analytical SQL queries and views to answer business questions. 
2. Exported results to Excel for visualization and insight generation.

Key insights:-
1. Total delivered-order revenue (analysis period): R$ 15,422,461.77.  
2. Revenue concentrated in a few states; São Paulo leads with R$ 5,770,266.19 (SP, RJ, MG ≈ 62.5% of revenue).  
3. Payment methods used skewed to credit cards (~73.9% of transactions); boleto ~19.0%.  :-(note payments may have multiple transaction for an order)
4. Top categories by revenue: Health_Beauty, Watches_Gifts, Bed_Bath_Table.  
5. Top 10% of sellers contribute ~66.7% of revenue.  
6. Repeat buyers ≈ 3% of customers, contributing ≈ 5.6% of revenue.  
7. Cancellations cause measurable revenue loss in specific product categories:- Cool_Stuff R$ 14,455.46, Sports_Leisure R$ 8,308.05, Computers_Accessories R$ 7,632.30..

Top recommendations :-
1. Prioritize operations and marketing in high-value states. 
2. Implement seller retention and support for top-performing sellers. 
3. Investigate and reduce causes of cancellations. 
4. Drive initiatives to increase repeat purchases.

How to reproduce:-
1. Place cleaned CSVs in a local folder. 
2. Run Olist_E-Commerce_Data_Import.sql to create tables and load data (update file paths if needed). 
3. Run Olist_E-Commerce_Data_Analysis.sql for fetching data and export output results to Excel for data interpretation and making charts.

Files included:-
1. 9 Cleaned Data Sets CSV Files Can be Accessed via Google Drive Link:- https://drive.google.com/drive/folders/1Fn2eGGojkraMvEKqw8gOFL2u9W9mbGjl?usp=drive_link
2. Olist_E-Commerce_Data_Import.sql  (MySQL Script For Importing Cleaned CSV Files Into MySQL)
3. Olist_E-Commerce_Data_Analysis.sql  (MySQL Script For Fetching Relevant Data to Answer Business Questions)
4. Olist E Commerce Data Interpretation.Xlsx  (Excel File Containing MySQL Query Results in form of Tables and Charts for Data Interpretation)
5. E-Commerce Data Analysis Project Documentation by Shudhanshu Awasthi.pdf  (PDF File Containing Full Project Documentation Including Business Questions)


License
This project is licensed under the MIT License. See LICENSE for details.

Skills demonstrated: MySQL, data cleaning with Excel/Power Query, analytical querying, KPI interpretation and business recommendations.
