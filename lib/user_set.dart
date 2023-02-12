
class UserSet {
   final String name;
   final String designation;

   UserSet ({required this.name, required this.designation});

   Map<String,dynamic> toJson() => {
      'question': name,
      'answer' : designation,
   };

   static UserSet fromJson(Map<String, dynamic> json) => UserSet(
      name:json['name'],
      designation:json['designation'],
   );
}

