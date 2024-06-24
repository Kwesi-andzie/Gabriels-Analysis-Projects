--CREATE Database Insurance_Plan

CREATE TABLE DIM_DRG_Information
(
	DRG                  VARCHAR(20) NULL ,
	Diagnosis_Related_Group_Descri VARCHAR(20) NULL ,
	Major_Diagnostic_Category VARCHAR(20) NULL ,
	Major_Diagnostic_Category_Desc VARCHAR(20) NULL 
);



CREATE TABLE DIM_Health_Systems
(
	Health_Systems_Dim_Key VARCHAR(20) NULL ,
	Torch_Health_System_ID VARCHAR(20) NULL ,
	Name                 VARCHAR(20) NULL ,
	Address_Line__       VARCHAR(20) NULL ,
	Address_Line_2       VARCHAR(20) NULL ,
	Cirty                VARCHAR(20) NULL ,
	State                VARCHAR(20) NULL ,
	Zip                  VARCHAR(20) NULL ,
	Phone                VARCHAR(20) NULL ,
	Website              VARCHAR(20) NULL 
);



CREATE TABLE DIM_Hospital_Health_System_Aff
(
	Hospital_Health_Systems_Hospit VARCHAR(20) NULL ,
	Torch_Health_System_ID VARCHAR(20) NULL ,
	Torch_Hospital_ID    VARCHAR(20) NULL ,
	Type                 VARCHAR(20) NULL ,
	Effective_Begin      DATE NULL ,
	Effective_End        DATE NULL 
);



CREATE TABLE DIM_Hospitals
(
	Hospital_Dim_Key     VARCHAR(20) NULL ,
	Torch_Hospital_ID    VARCHAR(20) NULL ,
	Provider_Number      VARCHAR(20) NULL ,
	Hospital_Type        VARCHAR(20) NULL ,
	Zip                  VARCHAR(20) NULL ,
	Name                 VARCHAR(20) NULL ,
	Address_Line_1       VARCHAR(20) NULL ,
	Address_Line_2       VARCHAR(20) NULL ,
	City                 VARCHAR(20) NULL ,
	State                VARCHAR(20) NULL ,
	County_Name          VARCHAR(20) NULL ,
	Hosptial_Ownership   VARCHAR(20) NULL ,
	Phone                VARCHAR(20) NULL ,
	Formerly_Known_As    VARCHAR(20) NULL ,
	Deactivated_0_1_Flag VARCHAR(20) NULL ,
	Closed_0_1_Flag      VARCHAR(20) NULL ,
	Closed_Date          VARCHAR(20) NULL ,
	Primary_Ehr_Product_Name VARCHAR(20) NULL ,
	Primary_Ehr_Product_Version VARCHAR(20) NULL ,
	Suppression_0_1_Flag VARCHAR(20) NULL 
);



CREATE TABLE Fact_Episodes_Of_Care
(
	Hospital_Episodes_Of_Care_By_D INTEGER NULL ,
	Hospital_Dim_Key     VARCHAR(20) NULL ,
	Year_Key             DATE NULL ,
	DRG                  INTEGER NULL ,
	Count_Of_Episodes    INTEGER NULL ,
	Average_Amout_Paid_By_Medicare INTEGER NULL ,
	Average_Amount_Paid_By_Medicar INTEGER NULL ,
	Average_Amount_Paid_By_Medi149 INTEGER NULL ,
	Average_Amount_Charged_By_Faci INTEGER NULL ,
	Amount_Paid_By_Medicar INTEGER NULL ,
	Average_Amount_Paid_By_Medi155 VARCHAR(20) NULL ,
	Average_Length_Of_Stay_For_Hom INTEGER NULL ,
	Average_Length_Of_Stay_For_Hos INTEGER NULL ,
	Average_Length_Of_Stay_For_Reh INTEGER NULL ,
	Average_Length_Of_Stay_For_165 INTEGER NULL ,
	Average_Length_Of_Stay_For_SNF VARCHAR(20) NULL ,
	Average_Length_Of_Stay_For_Sub VARCHAR(20) NULL 
);



CREATE TABLE Fact_Hospital_Beds
(
	Hospital_Cost_Reports_Beds_Fac VARCHAR(20) NULL ,
	Hospital_Dim_Key     VARCHAR(20) NULL ,
	Year_Key             DATE NULL ,
	Burn_Icu_Beds        CHAR(18) NULL ,
	Coronary_Care_Beds   INTEGER NULL ,
	Hospice_Beds         INTEGER NULL ,
	Intensive_Care_Beds  INTEGER NULL ,
	Nursing_Facility_Beds INTEGER NULL ,
	Other_Long_Term_Care_Beds INTEGER NULL ,
	Other_Special_Care_Beds INTEGER NULL ,
	Skilled_Nursing_Facility_Beds INTEGER NULL ,
	Surgical_Intensive_Care_Beds INTEGER NULL ,
	Labor_And_Delivery_Beds INTEGER NULL ,
	Subprovider_IPF_Beds INTEGER NULL ,
	Subprovider_IRF_Beds INTEGER NULL ,
	Subprovider_Others_Beds INTEGER NULL ,
	Hospital_Adult_Peds_Beds INTEGER NULL ,
	Inpatient_Total_Beds INTEGER NULL 
);



CREATE TABLE Fact_Hospital_Discharges
(
	Hospital_Cost_Report_Discharge VARCHAR(20) NULL ,
	Hospital_Dim_Key     VARCHAR(20) NULL ,
	Year_Key             DATE NULL ,
	Title_V__Discharges  VARCHAR(20) NULL ,
	Medicare_Discharges  INTEGER NULL ,
	Medicaid_Discharges  INTEGER NULL ,
	Total_Discharges     INTEGER NULL ,
	Title_V_Hospital_Adult_Peds_Di VARCHAR(20) NULL ,
	Medicare_Hospital_Adult_Peds_D INTEGER NULL ,
	Total_Hospital_Adult_Peds_Disc INTEGER NULL ,
	Title_V_Subprovider_IPF_Discha VARCHAR(20) NULL ,
	Medicare_Subprovider_IPF_Disch INTEGER NULL ,
	Medicaid_Subprovider_IPF_Disch INTEGER NULL ,
	Total_Subprovider_IPF_Discharg INTEGER NULL ,
	Medicare_Subprovider_IRF_Disch INTEGER NULL ,
	Medicaid_Subprovider_IRF_Disch INTEGER NULL ,
	Total_Subprovider_IRF_Discharg INTEGER NULL ,
	Title_V_Subprovider_IRF_Discha VARCHAR(20) NULL ,
	Medicare_Subprovider_Other_Dis INTEGER NULL ,
	Medicaid_Subprovider_Other_Dis INTEGER NULL ,
	Total_Subprovider_Other_Discha INTEGER NULL ,
	Medicare_HMO_Discharges INTEGER NULL ,
	Other_Long_Term_Care_Discharge INTEGER NULL 
);



CREATE TABLE Fact_Hospital_Revenue
(
	Hospital_Cost_Report_Total_Rev VARCHAR(20) NULL ,
	Hospital_Dim_Key     VARCHAR(20) NULL ,
	Year_Key             DATE NULL ,
	Hospital_General_Revenue INTEGER NULL ,
	Subprovider_IPF_Revenue INTEGER NULL ,
	Subprovider_IRF_Revenue CHAR(18) NULL ,
	Subprovider_Other_Revenue VARCHAR(20) NULL ,
	Swing_Bed_SNF_Revenue INTEGER NULL ,
	Swing_Bed_NF_Revenue INTEGER NULL ,
	Skilled_Nursing_Facility_Reven INTEGER NULL ,
	Nursing_Facility_Revenue INTEGER NULL ,
	Other_Long_Term_Care_Revenue INTEGER NULL ,
	General_Care_Services_Revenue INTEGER NULL ,
	Intensive_Care_Unit_Revenue INTEGER NULL ,
	Coronary_Care_Unit_Revenue INTEGER NULL ,
	Burn_Intensive_Care_Unit_Reven INTEGER NULL ,
	Surgical_Intensive_Care_Unit_R INTEGER NULL ,
	Intensive_Care_Services_Revenu INTEGER NULL ,
	Inpatient_Routine_Care_Revenue INTEGER NULL ,
	Ancillary_Services_Revenue INTEGER NULL ,
	Outpatient_Services_Revenue INTEGER NULL ,
	Rural_Health_Clinc_Revenue INTEGER NULL ,
	Federally_Qualified_Health_Cen INTEGER NULL ,
	Home_Health_Agency_Revenue INTEGER NULL ,
	Ambulance_Revenue    INTEGER NULL ,
	Rehabilitation_Providers_Reven INTEGER NULL ,
	Ambulatory_Surgical_Center_Rev INTEGER NULL ,
	Hospice_Revenue      INTEGER NULL ,
	Other_Revenue        INTEGER NULL ,
	Total_Patient_Revenue INTEGER NULL ,
	Contractual_Allowances_Discoun INTEGER NULL ,
	Net_Patient_Revenue  INTEGER NULL ,
	Net_Income_From_Service_To_Pat INTEGER NULL 
);



CREATE TABLE Fact_Hospital_Value_Based_Purc
(
	Value_Based_Purchasing_Fact_Ke VARCHAR(20) NULL ,
	Hospital_Dim_Key     VARCHAR(20) NULL ,
	Year_Key             VARCHAR(20) NULL ,
	Weighted_Clinical_Process_Of_C INTEGER NULL ,
	Weighted_Patient_Experience_Of INTEGER NULL ,
	Weighted_Effieciency_Domain_Sc INTEGER NULL ,
	Total_Performance_Score INTEGER NULL ,
	Actual_Fy_Hospital_VBP_Adjustm INTEGER NULL ,
	Estimated_VBP_Adjustment_Dolla INTEGER NULL 
);



SELECT *
FROM[dbo].[DIM_DRG_Information]

SELECT *
FROM[dbo].[Fact_Episodes_Of_Care]

SELECT *
FROM[dbo].[DIM_Health_Systems]

SELECT *
FROM[dbo].[Fact_Hospital_Beds]

SELECT *
FROM[dbo].[Fact_Hospital_Discharges]

SELECT *
FROM[dbo].[Fact_Hospital_Revenue]

SELECT *
FROM[dbo].[DIM_Hospitals]

SELECT *
FROM[dbo].[Fact_Hospital_Value_Based_Purc]

SELECT *
FROM[dbo].[DIM_Hospital_Health_System_Aff]
