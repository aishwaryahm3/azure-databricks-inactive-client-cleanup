CREATE TABLE cleaned_clients (
  client_id NVARCHAR(50),
  name NVARCHAR(255),
  is_live NVARCHAR(5),
  status NVARCHAR(50),
  last_updated DATE,
  onboarded_on DATE,
  location NVARCHAR(100),
  phone_number NVARCHAR(100),
  risk_score FLOAT,
  created_ts NVARCHAR(100),
  updated_by NVARCHAR(100),
  update_date DATE NOT NULL,
  final_updated_by NVARCHAR(100) NOT NULL
);



SELECT TOP 10 * FROM cleaned_clients;


SELECT TOP 10 * FROM cleaned_clients;

