import '../utils/text.utils.dart';
import 'guard_argument.dart';

class Guard {
  static String? combine(List<String?> list) {
    for (String? item in list) {
      if (item != null) {
        return item;
      }
    }

    return null;
  }

  static String? againstUndefined(String name, dynamic value) {
    if (value == null) {
      return '$name is undefined';
    }

    return null;
  }

  static String? againstEmptyString(String name, dynamic value) {
    final guardUndefined = Guard.againstUndefined(name, value);
    if (guardUndefined != null) return guardUndefined;

    if (value is! String) {
      return '$name is not a string';
    }

    if (value.isEmpty) {
      return '$name is empty';
    }

    return null;
  }

  static String? againstStringLength(
      String name, dynamic value, int min, int max) {
    final guardEmptyString = Guard.againstEmptyString(name, value);
    if (guardEmptyString != null) return guardEmptyString;

    if ((value as String).length < min) {
      return '$name should be at least $min characters';
    }

    if (value.length > max) {
      return '$name should only have $max maximum characters';
    }

    return null;
  }

  static String? againstEmptyArray(String name, List<dynamic>? value) {
    final guardUndefined = Guard.againstUndefined(name, value);
    if (guardUndefined != null) return guardUndefined;

    if (value!.isEmpty) {
      return '$name is empty';
    }

    return null;
  }

  static String? againstInvalidArrayItem(
      String name, List<dynamic> array, dynamic value) {
    final guardUndefined = Guard.againstUndefined(name, value);
    if (guardUndefined != null) return guardUndefined;

    if (array.isEmpty) {
      return 'Invalid empty array';
    }

    if (!array.contains(value)) {
      return '$name value is invalid';
    }

    return null;
  }

  static String? againstInvalidEmail(String name, dynamic value) {
    final guardEmptyString = Guard.againstEmptyString(name, value);
    if (guardEmptyString != null) return guardEmptyString;

    final RegExp regex = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
      caseSensitive: false,
      multiLine: false,
    );

    if (!regex.hasMatch(value)) {
      return '$name is invalid';
    }

    return null;
  }

  static String? againstInvalidPassword(String name, dynamic value) {
    final guardEmptyString = Guard.againstEmptyString(name, value);
    if (guardEmptyString != null) return guardEmptyString;

    if ((value as String).length < 8) {
      return '$name should be at least 8 characters';
    }

    return null;
  }

  static String? againstInvalidConfirmPassword(
      String name, dynamic value, dynamic password, String passwordName) {
    final guardEmptyString = Guard.againstEmptyString(name, value);
    if (guardEmptyString != null) return guardEmptyString;

    final guardEmptyPassword = Guard.againstEmptyString(passwordName, password);
    if (guardEmptyPassword != null) return guardEmptyPassword;

    if (value != password) {
      return '$name did not match with $passwordName';
    }

    return null;
  }

  static String? againstStringNotMatch(
      String name, String reference, dynamic value) {
    final guardEmptyString = Guard.againstEmptyString(name, value);
    if (guardEmptyString != null) return guardEmptyString;

    if (reference != value) {
      return '$name did not match';
    }

    return null;
  }

  static String? againstUndefinedBulk(List<GuardArgument> args) {
    for (final arg in args) {
      final result = Guard.againstUndefined(arg.name, arg.value);
      if (result != null) return result;
    }

    return null;
  }

  static String? againstUnexistingStringFromList(
      String name, String? value, List<String> list) {
    final guardEmptyString = Guard.againstEmptyString(name, value);
    if (guardEmptyString != null) return guardEmptyString;

    if (!list.contains(value)) {
      return '$name is invalid. It should be one of the list [${list.join(',')}]';
    }

    return null;
  }

  static String? againstUnexistingFromList<T>(
      String name, T? value, List<T> list) {
    final guardEmptyString = Guard.againstUndefined(name, value);
    if (guardEmptyString != null) return guardEmptyString;

    if (!list.contains(value)) {
      return '$name is invalid. It should be one of the list [${list.join(',')}]';
    }

    return null;
  }

  static String? againstInvalidDouble(String name, dynamic value) {
    final guardUndefined = Guard.againstUndefined(name, value);
    if (guardUndefined != null) return guardUndefined;

    if (value.runtimeType == String) {
      try {
        double.parse((value as String).replaceAll(",", ""));
        return null;
      } catch (e) {
        return '$name is invalid';
      }
    }

    if (value.runtimeType == double || value.runtimeType == int) {
      return null;
    }
    return '$name is invalid';
  }

  static String? againstInvalidInteger(String name, dynamic value) {
    final guardUndefined = Guard.againstUndefined(name, value);
    if (guardUndefined != null) return guardUndefined;

    if (value.runtimeType == String) {
      try {
        int.parse((value as String));
        return null;
      } catch (e) {
        return '$name is invalid';
      }
    }

    if (value.runtimeType == int) {
      return null;
    }
    return '$name is invalid';
  }

  static String? againstZero(String name, dynamic value) {
    final guardInvalidDouble = Guard.againstInvalidDouble(name, value);
    if (guardInvalidDouble != null) return guardInvalidDouble;

    late double num = 0;
    if (value.runtimeType == String) {
      try {
        num = double.parse((value as String).replaceAll(",", ""));
      } catch (e) {
        return '$name is invalid';
      }
    } else {
      num = value.runtimeType == double ? value : double.tryParse(value) ?? 0;
    }

    if (num == 0) {
      return '$name should be above 0';
    }

    return null;
  }

  static String? againstInvalidDate(String name, dynamic value) {
    final guardUndefined = Guard.againstUndefined(name, value);
    if (guardUndefined != null) return guardUndefined;

    if (value is DateTime) {
      return null;
    }

    try {
      DateTime.parse(value);
      return null;
    } catch (e) {
      return '$name is invalid';
    }
  }

  static String? againstDoubleOutOfRange(
      String name, dynamic value, dynamic limit) {
    final invalidValue = againstInvalidDouble(name, value);
    if (invalidValue != null) return invalidValue;

    final invalidLimit = againstInvalidDouble('Limit', limit);
    if (invalidLimit != null) return invalidLimit;

    late double tempValue;
    late double tempLimit;

    if (value is String) {
      tempValue = double.parse(value.replaceAll(',', ''));
    } else {
      tempValue = value;
    }

    if (limit is String) {
      tempLimit = double.parse(limit.replaceAll(',', ''));
    } else {
      tempLimit = limit;
    }

    if (tempValue > tempLimit) {
      return '$name should be less or equal to ${TextUtils.applyMask(limit)}';
    }

    return null;
  }
}
