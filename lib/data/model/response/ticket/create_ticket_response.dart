class CreateTicketResponse {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic deletedAt;
  final String title;
  final String ticketId;
  final String status;
  final String content;
  final String transactionId;
  final String creatorUsername;
  final String businessName;

  CreateTicketResponse({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.title,
    required this.ticketId,
    required this.status,
    required this.content,
    required this.transactionId,
    required this.creatorUsername,
    required this.businessName,
  });

  factory CreateTicketResponse.fromJson(Map<String, dynamic> json) =>
      CreateTicketResponse(
        id: json["ID"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        updatedAt: DateTime.parse(json["UpdatedAt"]),
        deletedAt: json["DeletedAt"],
        title: json["Title"],
        ticketId: json["TicketID"],
        status: json["Status"],
        content: json["Content"],
        transactionId: json["TransactionID"],
        creatorUsername: json["CreatorUsername"],
        businessName: json["BusinessName"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "CreatedAt": createdAt.toIso8601String(),
        "UpdatedAt": updatedAt.toIso8601String(),
        "DeletedAt": deletedAt,
        "Title": title,
        "TicketID": ticketId,
        "Status": status,
        "Content": content,
        "TransactionID": transactionId,
        "CreatorUsername": creatorUsername,
        "BusinessName": businessName,
      };
}
