public class LeaderboardListController {
/*	public Integer PAGE_LIMIT = 10;

	public Map<Integer, List<PerformanceRank>> GetTotalScore { get { return totalScoreMap;} }
	public Map<Integer, List<PerformanceRank>> GetResult { get { return resultMap;} }

	
	@AuraEnabled
	public static List<Yearly_Performance_Score__c> getLightningScores(){
	    return [SELECT Total_Score__c, User_Performance__r.User__r.Name, User_Performance__r.User__r.SmallPhotoUrl 
			FROM Yearly_Performance_Score__c 
			WHERE Name = :String.valueOf(PerformanceUtils.CURRENT_YEAR) AND Total_Score__c != null 
			ORDER BY Total_Score__c DESC];
	}

	@AuraEnabled
	public static List<Yearly_Performance_Score__c> getLightningResults(){
	    return [SELECT Result__c, User_Performance__r.User__r.Name, User_Performance__r.User__r.SmallPhotoUrl 
			FROM Yearly_Performance_Score__c 
			WHERE Name = :String.valueOf(PerformanceUtils.CURRENT_YEAR) AND Result__c != null 
			ORDER BY Result__c DESC];
	}

	private Map<Integer, List<PerformanceRank>> totalScoreMap;
	private Map<Integer, List<PerformanceRank>> resultMap;

	public Integer ScorePageKey { get; set; }
	public Integer ResultPageKey { get; set; }

	public Boolean ShowScorePaging { get{ return totalScoreMap.size() > 1 ? true : false;} }
	public Boolean ShowResultPaging { get{ return resultMap.size() > 1 ? true : false; } }

	public LeaderboardListController(){
		ScorePageKey = 1;
		ResultPageKey = 1;

		List<Yearly_Performance_Score__c> scoreList = [SELECT Total_Score__c, User_Performance__r.User__r.Name, User_Performance__r.User__r.SmallPhotoUrl 
			FROM Yearly_Performance_Score__c 
			WHERE Name = :String.valueOf(PerformanceUtils.CURRENT_YEAR) AND Total_Score__c != null 
			ORDER BY Total_Score__c DESC];

		List<Yearly_Performance_Score__c> resultList = [SELECT Result__c, User_Performance__r.User__r.Name, User_Performance__r.User__r.SmallPhotoUrl 
			FROM Yearly_Performance_Score__c 
			WHERE Name = :String.valueOf(PerformanceUtils.CURRENT_YEAR) AND Result__c != null 
			ORDER BY Result__c DESC];

		totalScoreMap = createPerformanceRankMap(scoreList);
		resultMap = createPerformanceRankMap(resultList);
	}

	private class PerformanceRank{
		public Integer UserRank { get; set; }
		public Yearly_Performance_Score__c YearlyPerformance { get; set; }

		PerformanceRank(Integer rank, Yearly_Performance_Score__c yps){
			UserRank = rank;
			YearlyPerformance = yps;
		}
	}

	//To create the pagination and to get the rank of each user we create a PerformanceRankMap
	public Map<Integer, List<PerformanceRank>> createPerformanceRankMap(List<Yearly_Performance_Score__c> ypsList){
		Map<Integer, List<PerformanceRank>> performanceRankMap = new Map<Integer, List<PerformanceRank>>();
		Integer count = 1;

		for (Yearly_Performance_Score__c yps : ypsList){
				Integer key = GeneratePageKey(count);
				if (performanceRankMap.containsKey(key)){
					performanceRankMap.get(key).add(new PerformanceRank(count, yps));
				}else{
					List<PerformanceRank> prList = new List<PerformanceRank>();
					prList.add(new PerformanceRank(count, yps));
					performanceRankMap.put(key, prList);
				}
			count++;
		}

		return performanceRankMap;
	}
	
	//Method to generate pagingkeys
	public Integer GeneratePageKey(Integer count){	
	    return count / PAGE_LIMIT == 0 ? 1 : count / PAGE_LIMIT;
	}


*/

}