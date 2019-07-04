class product {
  final String name;
  final num income;
  final int duration;
  final String totalAmount;
  final int status;
  final int progress;
  final String durationUnit;

  product(this.name, this.income,this.duration,this.totalAmount,this.status,this.progress,this.durationUnit);

  product.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        income=json['income'],
        duration=json['duration'],
        totalAmount = json['totalAmount'],
        status=json['status'],
  durationUnit=json['durationUnit'],
  progress=json['progress'];

  Map<String, dynamic> toJson() =>
      <String, dynamic>{
        'name': name,
        'income': income,
        'duration':duration,
        'totalAmount':totalAmount,
        'status':status,
        'progress':progress,
        'durationUnit':durationUnit,
      };
}