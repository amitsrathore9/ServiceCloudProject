/**
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 * Class Name      : CaseEscalationScheduable
 * Author          : <YourName>
 * Created Date    : Mar 4, 2026
 * Last Modified By: <YourName>
 * Last Modified On: Mar 4, 2026
 * Description     : This class implements for......
 *  
 * Change History  :
 *  Date          │   Author     │   Change
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 *  Mar 4, 2026  │ <YourName>   │ Initial version
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 */

global class CaseEscalationScheduable implements Schedulable {
	global void execute(SchedulableContext sc) {

		DateTime nowTime = System.now();

		List<Case> caseList = [
			SELECT Id, SLA_Deadline__c, Status, Escalation_Status__c, OwnerId
			FROM Case
			WHERE SLA_Deadline__c < :nowTime
			AND Status != 'Closed'
			AND Escalation_Status__c != 'Escalated'
		];

		List<Task> taskList = new List<Task>();

		for(Case cs : caseList){

			cs.Escalation_Status__c = 'Escalated';

			Task ts = new Task();
			ts.WhatId = cs.Id;
			ts.OwnerId = cs.OwnerId;
			ts.Priority = 'High';
			ts.Status = 'Not Started';
			ts.Subject = 'Case SLA Breach';
			ts.Description = 'This case exceeded SLA and requires immediate attention.';
			
			taskList.add(ts);
		}

		if(!caseList.isEmpty()){
			update caseList;
		}

		if(!taskList.isEmpty()){
			insert taskList;
		}
	}
}