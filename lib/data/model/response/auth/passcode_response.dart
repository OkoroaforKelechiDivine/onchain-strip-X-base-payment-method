
class PasscodeResponse {
    final bool message;

    PasscodeResponse({
        required this.message,
    });

    factory PasscodeResponse.fromJson(Map<String, dynamic> json) => PasscodeResponse(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}
