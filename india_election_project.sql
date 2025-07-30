select distinct
count(`Parliament Constituency`) as Total_seats
from constituencywise_results;

select 
s.state as State_name,
count(cr.`Parliament Constituency`) as Total_state_seats
from 
constituencywise_results cr
inner join statewise_results sr on cr.`Parliament Constituency`= sr.`Parliament Constituency`
INNER JOIN states s ON sr.`State ID`=s.`State ID`
GROUP BY s.state;
-- total seats won by NDA
SELECT 
  SUM(CASE
  WHEN party In (
      'Bharatiya Janata Party - BJP',
 'Telugu Desam - TDP',
'Janata Dal  (United) - JD(U)',
'AJSU Party - AJSUP',
'Apna Dal (Soneylal) - ADAL',
'Asom Gana Parishad - AGP',
'Hindustani Awam Morcha (Secular) - HAMS',
'Janasena Party - JnP',
'Janata Dal (Secular) - JD(S)',
'Lok Janshakti Party(Ram Vilas) - LJPRV',
'Nationalist Congress Party - NCP',
'Rashtriya Lok Dal - RLD',
'Sikkim Krantikari Morcha - SKM'
  ) THEN Won
  ELSE 0
  END) AS NDA_Total_Seats_Won
  FROM Partywise_results;
-- total seats won by I.N.D.I.A.
SELECT
  party AS Party_Name,
  Won AS Seats_won
  FROM partywise_results
  WHERE
   party IN(
'Bharatiya Janata Party - BJP',
 'Telugu Desam - TDP',
'Janata Dal  (United) - JD(U)',
'AJSU Party - AJSUP',
'Apna Dal (Soneylal) - ADAL',
'Asom Gana Parishad - AGP',
'Hindustani Awam Morcha (Secular) - HAMS',
'Janasena Party - JnP',
'Janata Dal (Secular) - JD(S)',
'Lok Janshakti Party(Ram Vilas) - LJPRV',
'Nationalist Congress Party - NCP',
'Rashtriya Lok Dal - RLD',
'Sikkim Krantikari Morcha - SKM'
 
) 
ORDER By Seats_won DESC;
-- seat won by INDIA alliance
SELECT 
  SUM(CASE
  WHEN party In (
'Indian National Congress - INC',
'Aam Aadmi Party - АААР',
'All India Trinamool Congress - AITC',
'Bharat Adivasi Party - BHRTADVSIP',
'Communist Party of India (Marxist) - CPI(M)',
'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
'Communist Party of India - CPI',
'Dravida Munnetra Kazhagam - DMK',
'Indian Union Muslim League - IUML',
'Jammu & Kashmir National Conference - JKN',
'Jharkhand Mukti Morcha - JMM',
'Jammu & Kashmir National Conference - JKN',
'Kerala Congress - KEC',
'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
'Rashtriya Janata Dal - RJD',
'Rashtriya Loktantrik Party - RLTP',
'Revolutionary Socialist Party - RSP',
'Samajwadi Party - SP',
'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
'Viduthalai Chiruthaigal Katchi - VCK'
  ) THEN Won
  ELSE 0
  END) AS INDIA_Total_Seats_Won
  FROM Partywise_results;
  
  SELECT Party,
  Won FROM partywise_results
  Where Party IN(
  'Indian National Congress - INC',
'Aam Aadmi Party - АААР',
'All India Trinamool Congress - AITC',
'Bharat Adivasi Party - BHRTADVSIP',
'Communist Party of India (Marxist) - CPI(M)',
'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
'Communist Party of India - CPI',
'Dravida Munnetra Kazhagam - DMK',
'Indian Union Muslim League - IUML',
'Jammu & Kashmir National Conference - JKN',
'Jharkhand Mukti Morcha - JMM',
'Jammu & Kashmir National Conference - JKN',
'Kerala Congress - KEC',
'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
'Rashtriya Janata Dal - RJD',
'Rashtriya Loktantrik Party - RLTP',
'Revolutionary Socialist Party - RSP',
'Samajwadi Party - SP',
'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
'Viduthalai Chiruthaigal Katchi - VCK'
)

ORDER BY Won DESC;


-- add new column in partywise_results ,ADD party alliances
ALTER TABLE partywise_results
 ADD party_alliance VARCHAR(50);
 
 
 UPDATE partywise_results
 SET party_alliance ='I.N.D.I.A'
 WHERE Party IN(
 'Indian National Congress - INC',
'Aam Aadmi Party - АААР',
'All India Trinamool Congress - AITC',
'Bharat Adivasi Party - BHRTADVSIP',
'Communist Party of India (Marxist) - CPI(M)',
'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
'Communist Party of India - CPI',
'Dravida Munnetra Kazhagam - DMK',
'Indian Union Muslim League - IUML',
'Jammu & Kashmir National Conference - JKN',
'Jharkhand Mukti Morcha - JMM',
'Jammu & Kashmir National Conference - JKN',
'Kerala Congress - KEC',
'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
'Rashtriya Janata Dal - RJD',
'Rashtriya Loktantrik Party - RLTP',
'Revolutionary Socialist Party - RSP',
'Samajwadi Party - SP',
'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
'Viduthalai Chiruthaigal Katchi - VCK'
 );
 
 UPDATE partywise_results
 SET party_alliance ='NDA'
 WHERE Party IN(
 'Bharatiya Janata Party - BJP',
 'Telugu Desam - TDP',
'Janata Dal  (United) - JD(U)',
'AJSU Party - AJSUP',
'Apna Dal (Soneylal) - ADAL',
'Asom Gana Parishad - AGP',
'Hindustani Awam Morcha (Secular) - HAMS',
'Janasena Party - JnP',
'Janata Dal (Secular) - JD(S)',
'Lok Janshakti Party(Ram Vilas) - LJPRV',
'Nationalist Congress Party - NCP',
'Rashtriya Lok Dal - RLD',
'Sikkim Krantikari Morcha - SKM'
 
 );
 UPDATE partywise_results
 SET party_alliance='OTHER'
 where party_alliance IS NULL;
 
 SELECT party_alliance,
 sum(Won) AS total_won
 FROM partywise_results
 GROUP BY party_alliance;
 
 SELECT 
 cr.`Winning Candidate`,
 pr.`Party`,
 pr.`party_alliance`,
 cr.`Total Votes`,
 s.`State`,
 cr.`Constituency Name`
 FROM 
 constituencywise_results cr INNER JOIN partywise_results pr ON cr.`Party ID`=pr.`Party ID`
 INNER JOIN statewise_results sr ON cr.`Parliament Constituency`=sr.`Parliament Constituency`
 INNER JOIN states s ON sr.`State ID`=s.`State ID`
 WHERE cr.`Constituency Name`='AGRA'
 ;
 
 -- distribution of EVM votes versus portal votes for candidate in a specific constituency
 SELECT 
 cd.`EVM Votes`,
 cd.`Postal Votes`,
 cd.`Candidate`,
 cr.`Constituency Name`
 FROM constituencywise_results cr JOIN constituencywise_details cd
 ON cr.`Constituency ID`=cd.`Constituency ID`
 WHERE cr.`Constituency Name`='AMETHI'
 ;
 -- which parties won the most seats in a states and how many sets did each party win
 SELECT 
   p.`Party`,
   COUNT(cr.`Constituency ID`) AS seats_won
   FROM constituencywise_results cr
   JOIN partywise_results p ON cr.`Party ID`=p.`Party ID`
   JOIN statewise_results sr ON cr.`Parliament Constituency`=sr.`Parliament Constituency`
   JOIN states s ON sr.`State ID`=s.`State ID`
   WHERE s.State='West Bengal'
   GROUP BY p.`Party`
   ORDER BY seats_won desc;
   
   -- which alliance won the most seats in a state and how many seats they won
   
   SELECT 
   p.`party_alliance`,
   COUNT(cr.`Constituency ID`) AS seats_won
   FROM constituencywise_results cr
   JOIN partywise_results p ON cr.`Party ID`=p.`Party ID`
   JOIN statewise_results sr ON cr.`Parliament Constituency`=sr.`Parliament Constituency`
   JOIN states s ON sr.`State ID`=s.`State ID`
   WHERE s.State='West Bengal'
   GROUP BY p.`party_alliance`
   ORDER BY seats_won desc;
   
   -- which candidate received the highest number of EVM votes in each constituency
   SELECT 
   cr.`Constituency Name`,
   cd.`Constituency ID`,
   cd.`Candidate`,
   cd.`EVM Votes`
   FROM constituencywise_details cd
   INNER JOIN constituencywise_results cr ON cd.`Constituency ID`=cr.`Constituency ID`
   WHERE cd.`EVM Votes`=(
   SELECT MAX(cd1.`EVM Votes`)
   FROM constituencywise_details cd1
   WHERE cd1.`Constituency ID`=cd.`Constituency ID`
   
   )
   ORDER BY cd.`EVM Votes` DESC
   
   ;
   -- what is the total number of seats won by each party allainces in each state
   SELECT 
   s.`state`,
   SUM(CASE WHEN p.party_alliance='NDA' THEN 1 ELSE 0 END) AS NDA_SEAT_WON,
   SUM(CASE WHEN p.party_alliance='I.N.D.I.A' THEN 1 ELSE 0 END) AS INDIA_SEAT_WON,
   SUM(CASE WHEN p.party_alliance='OTHER' THEN 1 ELSE 0 END) AS OTHER

   FROM constituencywise_results cr
   JOIN partywise_results p ON cr.`Party ID`=p.`Party ID`
   JOIN statewise_results sr ON cr.`Parliament Constituency`=sr.`Parliament Constituency`
   JOIN states s ON sr.`State ID`=s.`State ID`
   GROUP BY s.`state`
   ;
   
   -- which candidate won and which candidate was runner up in each constituency of state in 2024 election
  WITH RankedCandidates AS(
  SELECT
   cd.`Constituency ID`, 
   cd.`Candidate`,
   cd.`Party`,
   cd.`EVM Votes`,
cd.`Postal Votes`,
cd.`EVM Votes` + cd.`Postal Votes` AS Total_Votes,
ROW_NUMBER() OVER (PARTITION BY cd.`Constituency ID` ORDER BY cd.`EVM Votes` + cd.`Postal Votes` DESC) AS VoteRank
FROM
constituencywise_details cd
JOIN
constituencywise_results cr ON cd.`Constituency ID` = cr.`Constituency ID`
JOIN
statewise_results sr ON cr.`Parliament Constituency` = sr.`Parliament Constituency`
JOIN
states s ON sr.`State ID` = s.`State ID`
WHERE 
s.`state` = 'Maharashtra'
)
SELECT cr.`Constituency Name`,
MAX(CASE WHEN rc.VoteRank = 1 THEN rc. Candidate END) AS Winning_Candidate,
MAX(CASE WHEN rc.VoteRank = 2 THEN rc. Candidate END) AS Runnerup_Candidate
FROM
RankedCandidates rc
JOIN
constituencywise_results cr ON rc.`Constituency ID`= cr.`Constituency ID`
GROUP BY cr.`Constituency Name`
ORDER BY cr.`Constituency Name`
;
   
   
   
 
