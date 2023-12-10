USE Beverage_Survey
SELECT*FROM Cities
SELECT*FROM fact_survey_responses
SELECT*FROM repondents

-- Who prefers energy drink more?  (male/female/non-binary?) 

SELECT Gender, COUNT(Respondent_id)
FROM repondents AS Number_of_Respondents
GROUP BY Gender

-- Which age group prefers energy drinks more?

SELECT Age, COUNT(Respondent_id)
FROM repondents AS Number_of_Respondents 
GROUP BY Age 

-- Which type of marketing reaches the most Youth (15-30)? 


 SELECT DISTINCT(Marketing_channels),COUNT(Age) AS No_of_Respondents_15_18
 FROM repondents
 INNER JOIN fact_survey_responses
  ON repondents.Respondent_ID = fact_survey_responses.Respondent_ID
  WHERE  Age = '15-18' 
  GROUP BY Age,Marketing_channels

  
 SELECT DISTINCT(Marketing_channels),COUNT(Age) AS No_of_Respondents_19_30
 FROM repondents
 INNER JOIN fact_survey_responses
  ON repondents.Respondent_ID = fact_survey_responses.Respondent_ID
  WHERE  Age = '19-30' 
  GROUP BY Age,Marketing_channels

  -- What are the preferred ingredients of energy drinks among respondents? 

SELECT DISTINCT(ingredients_expected),COUNT(Respondent_id)  AS Total_User
FROM fact_survey_responses 
GROUP BY  ingredients_expected

--What packaging preferences do respondents have for energy drinks? 

SELECT DISTINCT(Packaging_preference),COUNT(Respondent_id) AS Total_User
FROM fact_survey_responses 
GROUP BY Packaging_preference

SELECT DISTINCT(Packaging_preference),COUNT(Respondent_id) AS Total_User
FROM fact_survey_responses 
WHERE Current_brands = 'codeX'
GROUP BY Packaging_preference
 
--  Who are the current market leaders? 

SELECT DISTINCT(Current_brands),COUNT(Respondent_id) AS Total_User 
FROM fact_survey_responses
GROUP BY Current_brands

-- What are the primary reasons consumers prefer those brands over ours? 

SELECT DISTINCT(Reasons_for_choosing_brands),COUNT(Respondent_id) AS No_of_Respondent
FROM fact_survey_responses 
GROUP BY Reasons_for_choosing_brands

-- Which marketing channel can be used to reach more customers? 

SELECT DISTINCT(Marketing_channels), COUNT(Respondent_id) AS User_of_Channels 
FROM fact_survey_responses 
GROUP BY Marketing_channels

--What do people think about our brand? (overall rating) 

--  Which cities do we need to focus more on? 

SELECT DISTINCT(City_ID), COUNT(fact_survey_responses.Respondent_ID) AS Codex_User
FROM fact_survey_responses
INNER JOIN repondents
ON fact_survey_responses.Respondent_ID = repondents.Respondent_ID
WHERE Current_brands = 'CodeX'
GROUP BY City_ID

--Where do respondents prefer to purchase energy drinks?

SELECT DISTINCT(Purchase_location), COUNT(Respondent_ID) AS Location_prefer_to_by 
FROM fact_survey_responses 
GROUP BY Purchase_location

--What are the typical consumption situations for energy drinks among respondents? 

SELECT DISTINCT(Typical_consumption_situations), COUNT(Respondent_ID) AS Total_Count
FROM fact_survey_responses 
GROUP BY Typical_consumption_situations

-- What factors influence respondents' purchase decisions, such as price range and limited edition packaging? 

-- Pricing Factor

SELECT DISTINCT(Price_range), COUNT(Current_brands) AS No_of_Codex_brand 
FROM fact_survey_responses  WHERE Current_brands = 'CodeX' 
GROUP BY Current_brands,Price_range



