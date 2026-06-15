trigger CaseTrigger on Case(before insert) {
	
	if(Trigger.isInsert && Trigger.isBefore){
		CaseService.calculateSLADeadline(Trigger.new);
	}
}