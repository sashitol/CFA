public class YearlyPerformanceChartController {     
/*
    @AuraEnabled
    public  static Yearly_Performance_Score__c getYps(String ypsId){
        Yearly_Performance_Score__c yps;
        String currentYear = String.valueOf(Datetime.now().year());
        
        if(ypsId != ''){
            yps = [SELECT Id, Competence_Milestone__c, Contribution_Milestone__c, Result__c, User_Performance__r.User__r.Id, Competence_Score__c,
                   Client_Meetings_Target__c, Client_Meetings_Registered__c, Competence_Events_Attended__c, Competence_Events_Target__c, 
                   Total_Contribution_Score__c, Total_Client_Meetings_Registered__c,
                   User_Performance__r.User__r.SmallPhotoUrl,  User_Performance__r.User__r.Email, User_Performance__r.User__r.Name
                   FROM Yearly_Performance_Score__c 
                   WHERE Id = :ypsId];
            
            return yps;
        }
        
        yps = [SELECT Id, Competence_Milestone__c, Contribution_Milestone__c, 
               Result__c, User_Performance__r.User__r.Id, User_Performance__r.User__r.SmallPhotoUrl, Competence_Score__c,
               Client_Meetings_Target__c, Client_Meetings_Registered__c, Competence_Events_Attended__c, Competence_Events_Target__c, 
               Total_Contribution_Score__c, Total_Client_Meetings_Registered__c,
               User_Performance__r.User__r.Email, User_Performance__r.User__r.Name
               FROM Yearly_Performance_Score__c 
               WHERE User_Performance__r.User__r.Id = :UserInfo.getUserId() 
               AND Name = :currentYear LIMIT 1];
        
        return yps;          
    }
    
    @AuraEnabled
    public  static String getYearlyContributionScore(String userId){
        AggregateResult[] contributionEventScores = [SELECT SUM(Points__c) points, calendar_year(EndDateTime) year, calendar_month(EndDateTime) month
                                                     FROM Event
                                                     WHERE Event_Complete__c = true
                                                     AND Legacy_Activity__c = false
                                                     AND Owner.Id = :userId
                                                     GROUP BY calendar_year(EndDateTime), calendar_month(EndDateTime) 
                                                     ORDER BY calendar_year(EndDateTime)];
        
        AggregateResult[] contributionTaskScores = [SELECT SUM(Points__c) points, calendar_year(TaskEndDate__c) year, calendar_month(TaskEndDate__c) month
                                                    FROM Task
                                                    WHERE Status = 'Stängd'
                                                    AND Legacy_Activity__c = false
                                                    AND Owner.Id = :userId
                                                    GROUP BY calendar_year(TaskEndDate__c), calendar_month(TaskEndDate__c) 
                                                    ORDER BY calendar_year(TaskEndDate__c)];
        
        Map<Integer, Map<Integer, Integer>> contributionMap = mapYearlyScore(contributionEventScores);
        Map<Integer, Map<Integer, Integer>> taskMap = mapYearlyScore(contributionTaskScores);
        
        //Merge task and event points
        for(Integer taskYear : taskMap.keySet()){
            if(contributionMap.containsKey(taskYear)){
                for(Integer taskMonth : taskMap.get(taskYear).keySet()){
                    Integer totalSum = contributionMap.get(taskYear).get(taskMonth) + taskMap.get(taskYear).get(taskMonth);
                    contributionMap.get(taskYear).put(taskMonth, totalSum);
                }
            }else{
                contributionMap.put(taskYear, taskMap.get(taskYear));
            }
        }
        
        return Json.serialize(contributionMap);    
    }
    
    @AuraEnabled
    public  static String getYearlyCompetenceScore(String userId){
        AggregateResult[] competenceScores = [SELECT SUM(Competence_Points__c) points, calendar_year(Completed_On__c) year, calendar_month(Completed_On__c) month
                                              FROM Learning_Assignment__c 
                                              WHERE User__c = :userId
                                              AND Training_Plan_Section_Assignment__r.Training_Plan_Assignment__r.Status__c = 'Completed' 
                                              GROUP BY calendar_year(Completed_On__c), calendar_month(Completed_On__c) 
                                              ORDER BY calendar_year(Completed_On__c)];
        Map<Integer, Map<Integer, Integer>> competenceMap = mapYearlyScore(competenceScores);
        
        return Json.serialize(competenceMap);
    }
          
    private static Map<Integer, Map<Integer, Integer>> mapYearlyScore(AggregateResult[] score){   
        // Year,         Month,  Score
        Map<Integer, Map<Integer, Integer>>  yearMap = new Map<Integer, Map<Integer, Integer>> ();
        
        //Map everything... Every.... THING!!! 
        for (AggregateResult s : score){
            Integer year = Integer.valueOf(s.get('year'));
            Integer month = Integer.valueOf(s.get('month'));
            Integer points = Integer.valueOf(s.get('points'));
            if(year != Null || month != Null){
                month = month - 1;
                if (yearMap.containsKey(year)){
                    yearMap.get(year).put(month, points);
                } 
                else{
                    Map<Integer, Integer> monthMap = new Map<Integer, Integer>();
                    for(Integer i = 0; i <= 11; i++){
                        monthMap.put(i, 0);
                    }
                    monthMap.put(month, points);
                    yearMap.put(year, monthMap);
                }
            }
        }
        
        return yearMap;       
    }
*/
}