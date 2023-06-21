enum StatusCode {
  operationSucceeded,
  operationFailed,
  serverError,
  unAuthorized,
}

extension FetchCode on StatusCode {
  int get code {
    switch (this) {
      case StatusCode.operationSucceeded:
        return 200;
      case StatusCode.operationFailed:
        return 400;
      case StatusCode.serverError:
        return 500;
      case StatusCode.unAuthorized:
        return 401;
    }
  }
}
