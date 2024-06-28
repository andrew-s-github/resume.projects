	I created this project to demonstrate through understanding of MYSQL, python, and excel within the realms of data analysis. 

	SIMPLY PUT – 	I created an MYSQL schema through the help of https://dbdiagram.io/. Then exported the schema to be used in MYSQL. I created the tables and information in python. 
			Exported created data-frames from python in csv to be imported into excel for minor cleaning, before being finally imported into MYSQL database. I created queries on each table, 
			as well as a script containing joins across all the tables. I went back to python to do exploratory data analysis utilizing pandas, matplotlib, and seaborn. Finally, I created 
			an excel dashboard with an analysis sheet to cap the project. 
	
	I started this project using a website called https://dbdiagram.io/ to create the initial schema and template for the project. 
	After creating the schema, I exported it to MYSQL to use as the base of my data science process.
	
	I then begun working on creating the tables required, defined within https://dbdiagram.io/. My process for this was to work with tables that only gave information first, 
	then to work with tables then either passed along the information or with more complex relationships, second. For example, this would look like doing the vendor table, 
	the user table, user information table, stores table, then the product table and finally the sales and shipping tables. Build the tables that don’t have any foreign keys first and work your way in.

	After creating each table I would then export the data as csv into MYSQL. It’s important to note here I had some blemishes I took care of in excel instead of the more time-consuming process in python 
	more than a few times. In one instance taking information from a data-frame I had brackets around all the values. Instead of dealing with lists and series, I just used it as is then used excel find and 
	replace to deal with it instead.
	
	Once all the data was populated in MYSQL database, I ran queries on each induvial table to gain insight into the data.
	
	Then I created queries demonstrating joins across the whole database, showing how you would put together the structured information for analysis. 
	
	Back in python I explored the data using seaborn and matplotlib to gain insight before creating final dashboard. 
	
	I created views and queries for the purpose to be used in an excel dashboard
	
	I created the final dashboard using Microsoft Excel. This provides a visual understanding of the data and how you would utilize the information to further drive business decisions.
