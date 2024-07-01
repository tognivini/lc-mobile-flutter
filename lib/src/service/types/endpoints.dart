// ignore_for_file: non_constant_identifier_names

class Endpoints {
  final String LOGIN = '/api/auth/login';
  final String REFRESH_TOKEN = '/api/auth/refresh-token';
  final String LIST_USERS = '/api/user';
  final String LIST_RESPONSIBLES = '/api/user/responsibles';
  final String CREATE_USER = '/api/user/create';
  final String EDIT_USER = '/api/user/update/';

  // Schedules
  final String LIST_SCHEDULES = '/api/schedule';
  final String CREATE_SCHEDULE = '/api/schedule/create';
  final String CHECK_AVAILABLE_HOURS = '/api/schedule/get-available-hours';
  final String EDIT_SCHEDULE = '/api/schedule/update';
  final String DELETE_SCHEDULE = '/api/schedule';

  // Laundry
  final String LIST_ALL_LAUNDRY = '/api/laundry';
  final String LIST_AVAILABLE_LAUNDRY = '/api/laundry/get-available';
  final String CREATE_LAUNDRY = '/api/laundry/create';
  final String UPDATE_LAUNDRY = '/api/laundry/update';
  final String GET_LAUNDRY = '/api/laundry';
  final String EDIT_LAUNDRY = '/api/laundry';
  final String DELETE_LAUNDRY = '/api/laundry';

  // WashMachine
  final String GET_WASH_MACHINE = '/api/wash-machine';
  final String CREATE_WASH_MACHINE = '/api/wash-machine/create';
  final String UPDATE_WASH_MACHINE = '/api/wash-machine/update';
}
