import 'package:zeitplan/main/factory/phone_call/phone_call.dart';
import 'package:zeitplan/presentation/getx_contacts_presenter.dart';
import 'package:zeitplan/ui/page/contacts/contacts.dart';

import 'load_contact_factory.dart';

ContactsPresenter makeGetXContactsPresenter() => GetXContactsPresenter(
    loadContacts: makeRemoteLoadContactsWithLocalFallback(),
    phoneCaller: makeLauncherPhoneCall());
