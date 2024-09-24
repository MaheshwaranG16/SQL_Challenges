CREATE TABLE Missing_value
			(row_id int
            ,Job_role varchar(25)
            ,Skills varchar(25));
		
INSERT INTO Missing_value
				(row_id,Job_role,Skills)
                VALUES
                 (1,"Data Engineer","SQL")
                ,(2,null,"Python")
                ,(3,null,"AWS")
                ,(4,null,"Snowflake")
                ,(5,null,"Apache Spark")
                ,(6,"Web Developer","Java")
                ,(7,null,"HTML")
                ,(8,null,"CSS")
                ,(9,"Data Scientist","Python")
                ,(10,null,"Machine learning")
                ,(11,null,"Deep learning")
                ,(12,null,"Tableau");