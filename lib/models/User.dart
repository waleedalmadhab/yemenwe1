
class User {

 static final String uname="name";
 static final String utoken="token";
 static final String uphone="phone";
 static final String uemail="email";
 static final String utype="type";
 static final String udeptid="deptid";
 static final String udeptname="deptname";
 static final String ujobid="jobid";
 static final String ujobname="jobname";

  String name;
  String phone;
  String token;
  String email;
  String type;
  String deptID;
  String deptName;
  String jobId;
  String jobName;


  User();

  User.fromJson(Map<String, dynamic> json)
      : name = json['$uname'],
        phone = json['$uphone'],
        token = json['$utoken'],
        email = json['$uemail'],
        type = json['$utype'],
        deptID = json['$udeptid'],
        deptName = json['$udeptname'],
        jobId = json['$ujobid'],
        jobName = json['$ujobname']


 ;

  Map<String, dynamic> toJson() => {
    '$uname': name,
    '$uphone': phone,
    '$utoken': token,
    '$udeptid': deptID,
    '$udeptname': deptName,
    '$ujobid': jobId,
    '$ujobname': jobName,
    '$uemail': email,
    '$utype': type,
  };
}