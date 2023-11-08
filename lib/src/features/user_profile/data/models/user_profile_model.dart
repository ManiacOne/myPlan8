class UserProfileModel {
  String? sId;
  String? firstName;
  String? lastName;
  String? email;
  String? type;
  String? profilePhoto;
  List<QuestionAnswer>? questionAnswer;
  String? referralCode;
  String? contactNo;
  bool? isActive;
  bool? isDeleted;
  String? userId;
  Verification? verification;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? consentHandle;
  String? concentApproval;

  UserProfileModel(
      {this.sId,
      this.firstName,
      this.lastName,
      this.email,
      this.type,
      this.profilePhoto,
      this.questionAnswer,
      this.referralCode,
      this.contactNo,
      this.isActive,
      this.isDeleted,
      this.userId,
      this.verification,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.consentHandle,
      this.concentApproval});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    if (json['lastName'] != null) {
      lastName = json['lastName'];
    }
    email = json['email'];
    type = json['type'];
    if (json['profilePhoto'] != null) {
      profilePhoto = json['profilePhoto'];
    }
    if (json['questionAnswer'] != null) {
      questionAnswer = <QuestionAnswer>[];
      json['questionAnswer'].forEach((v) {
        questionAnswer!.add(QuestionAnswer.fromJson(v));
      });
    }
    if (json['referralCode'] != null) {
      referralCode = json['referralCode'];
    }
    if (json['contactNo'] != null) {
      contactNo = json['contactNo'];
    }
    isActive = json['isActive'];
    isDeleted = json['isDeleted'];
    userId = json['userId'];
    verification = json['verification'] != null
        ? Verification.fromJson(json['verification'])
        : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    if (json['consentHandle'] != null) {
      consentHandle = json['consentHandle'];
    }
    concentApproval = json['concentApproval'];
  }
}

class QuestionAnswer {
  String? question;
  String? type;
  String? value;
  List<Option>? option;

  QuestionAnswer({this.question, this.type, this.value, this.option});

  QuestionAnswer.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    type = json['type'];
    value = json['value'].toString();
    if (json['option'] != null) {
      option = <Option>[];
      json['option'].forEach((v) {
        option!.add(Option.fromJson(v));
      });
    }
  }
}

class Option {
  String? value;
  String? assets;

  Option({this.value, this.assets});

  Option.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    assets = json['assets'];
  }
}

class Verification {
  bool? vERIFYEMAIL;

  Verification({this.vERIFYEMAIL});

  Verification.fromJson(Map<String, dynamic> json) {
    vERIFYEMAIL = json['VERIFY_EMAIL'];
  }
}
