part of 'contact_bloc.dart';

abstract class ContactEvent extends Equatable {
  const ContactEvent();

  @override
  List<Object> get props => [];
}

class GetContactsEvent extends ContactEvent {}

class AddContactEvent extends ContactEvent {
  final Contacts contact;

  const AddContactEvent(this.contact);

  @override
  List<Object> get props => [contact];
}

class UpdateContactEvent extends ContactEvent {
  final Contacts oldContact;
  final Contacts updatedContact;

  const UpdateContactEvent(this.oldContact, this.updatedContact);

  @override
  List<Object> get props => [oldContact, updatedContact];
}

class DeleteContactEvent extends ContactEvent {
  final String name;

  const DeleteContactEvent(this.name);

  @override
  List<Object> get props => [name];
}
