abstract class ContactsStates {}

class ContactsInitial extends ContactsStates {}

class ChangeBottomNavState extends ContactsStates{}

class ChangeFabIconState extends ContactsStates{}

class ChangeRowIconState extends ContactsStates{}


class ContactCreateDataFromDBState extends ContactsStates {}
class ContactOpenDataFromDBState extends ContactsStates {}
class ContactDeleteDataFromDBState extends ContactsStates {}
class ContactInsertDataFromDBState extends ContactsStates {}
class ContactGetDataFromDBState extends ContactsStates {}
class ContactUpdateFavFromDBState extends ContactsStates {}
class ContactUpdateFromDBState extends ContactsStates {}