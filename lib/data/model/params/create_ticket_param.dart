class CreateTicketParam {
  final String title;
  final String content;
  final String transactionId;

  CreateTicketParam({
    required this.title,
    required this.content,
    required this.transactionId,
  });

  factory CreateTicketParam.fromJson(Map<String, dynamic> json) =>
      CreateTicketParam(
        title: json["title"],
        content: json["content"],
        transactionId: json["TransactionID"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
        "TransactionID": transactionId,
      };
}
