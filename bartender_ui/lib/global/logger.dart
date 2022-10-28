library logs;
import 'package:logger/logger.dart';

final logger = Logger();

void info(String msg){
  logger.i(msg);
}

void error(dynamic e, String msg){
  logger.e(e, msg);
}