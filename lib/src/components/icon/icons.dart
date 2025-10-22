import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/common/adaptive.dart';

enum AdpIcons {
  add(
    mICON: CupertinoIcons.add,
    wICON: FluentIcons.add_24_regular,
  ),
  addCircle(
    mICON: CupertinoIcons.add_circled,
    wICON: FluentIcons.add_circle_24_regular,
  ),
  addCircleFilled(
    mICON: CupertinoIcons.add_circled_solid,
    wICON: FluentIcons.add_circle_24_filled,
  ),
  airplane(
    mICON: CupertinoIcons.airplane,
    wICON: FluentIcons.airplane_24_regular,
  ),
  alarm(
    mICON: CupertinoIcons.alarm,
    wICON: FluentIcons.clock_alarm_24_regular,
  ),
  alarmFilled(
    mICON: CupertinoIcons.alarm_fill,
    wICON: FluentIcons.clock_alarm_24_filled,
  ),
  app(
    mICON: CupertinoIcons.app,
    wICON: FluentIcons.apps_24_regular,
  ),
  archive(
    mICON: CupertinoIcons.archivebox,
    wICON: FluentIcons.archive_24_regular,
  ),
  archiveFilled(
    mICON: CupertinoIcons.archivebox_fill,
    wICON: FluentIcons.archive_24_filled,
  ),
  arrowDown(
    mICON: CupertinoIcons.arrow_down,
    wICON: FluentIcons.arrow_down_24_regular,
  ),
  arrowLeft(
    mICON: CupertinoIcons.arrow_left,
    wICON: FluentIcons.arrow_left_24_regular,
  ),
  arrowRight(
    mICON: CupertinoIcons.arrow_right,
    wICON: FluentIcons.arrow_right_24_regular,
  ),
  arrowUp(
    mICON: CupertinoIcons.arrow_up,
    wICON: FluentIcons.arrow_up_24_regular,
  ),
  arrowDownCircle(
    mICON: CupertinoIcons.arrow_down_circle,
    wICON: FluentIcons.arrow_circle_down_24_regular,
  ),
  arrowLeftCircle(
    mICON: CupertinoIcons.arrow_left_circle,
    wICON: FluentIcons.arrow_circle_left_24_regular,
  ),
  arrowRightCircle(
    mICON: CupertinoIcons.arrow_right_circle,
    wICON: FluentIcons.arrow_circle_right_24_regular,
  ),
  arrowUpCircle(
    mICON: CupertinoIcons.arrow_up_circle,
    wICON: FluentIcons.arrow_circle_up_24_regular,
  ),
  arrowDownCircleFilled(
    mICON: CupertinoIcons.arrow_down_circle_fill,
    wICON: FluentIcons.arrow_circle_down_24_filled,
  ),
  arrowLeftCircleFilled(
    mICON: CupertinoIcons.arrow_left_circle_fill,
    wICON: FluentIcons.arrow_circle_left_24_filled,
  ),
  arrowRightCircleFilled(
    mICON: CupertinoIcons.arrow_right_circle_fill,
    wICON: FluentIcons.arrow_circle_right_24_filled,
  ),
  arrowUpCircleFilled(
    mICON: CupertinoIcons.arrow_up_circle_fill,
    wICON: FluentIcons.arrow_circle_up_24_filled,
  ),
  atMark(
    mICON: CupertinoIcons.at,
    wICON: FluentIcons.mention_24_regular,
  ),
  bag(
    mICON: CupertinoIcons.bag,
    wICON: FluentIcons.shopping_bag_24_regular,
  ),
  bagFilled(
    mICON: CupertinoIcons.bag_fill,
    wICON: FluentIcons.shopping_bag_24_filled,
  ),
  addToBag(
    mICON: CupertinoIcons.bag_badge_plus,
    wICON: FluentIcons.shopping_bag_arrow_left_24_regular,
  ),
  addToBagFilled(
    mICON: CupertinoIcons.bag_fill_badge_plus,
    wICON: FluentIcons.shopping_bag_arrow_left_24_filled,
  ),
  barcodeScanner(
    mICON: CupertinoIcons.barcode_viewfinder,
    wICON: FluentIcons.barcode_scanner_24_regular,
  ),
  battery0(
    mICON: CupertinoIcons.battery_0,
    wICON: FluentIcons.battery_0_24_regular,
  ),
  battery25(
    mICON: CupertinoIcons.battery_25,
    wICON: FluentIcons.battery_2_24_regular,
  ),
  battery75(
    mICON: CupertinoIcons.battery_75_percent,
    wICON: FluentIcons.battery_7_24_regular,
  ),
  battery100(
    mICON: CupertinoIcons.battery_full,
    wICON: FluentIcons.battery_10_24_regular,
  ),
  batteryCharge(
    mICON: CupertinoIcons.battery_charging,
    wICON: FluentIcons.battery_charge_24_regular,
  ),
  bed(
    mICON: CupertinoIcons.bed_double,
    wICON: FluentIcons.bed_24_regular,
  ),
  bedFilled(
    mICON: CupertinoIcons.bed_double_fill,
    wICON: FluentIcons.bed_24_filled,
  ),
  bolt(
    mICON: CupertinoIcons.bolt_fill,
    wICON: FluentIcons.flash_24_filled,
  ),
  bluetooth(
    mICON: CupertinoIcons.bluetooth,
    wICON: FluentIcons.bluetooth_24_regular,
  ),
  bluetoothConnected(
    mICON: CupertinoIcons.bluetooth,
    wICON: FluentIcons.bluetooth_connected_24_regular,
  ),
  bluetoothDisabled(
    mICON: CupertinoIcons.bluetooth,
    wICON: FluentIcons.bluetooth_disabled_24_regular,
  ),
  book(
    mICON: CupertinoIcons.book,
    wICON: FluentIcons.book_24_regular,
  ),
  bookFilled(
    mICON: CupertinoIcons.book_fill,
    wICON: FluentIcons.book_24_filled,
  ),
  bookmark(
    mICON: CupertinoIcons.bookmark,
    wICON: FluentIcons.bookmark_24_regular,
  ),
  bookmarkFilled(
    mICON: CupertinoIcons.bookmark_fill,
    wICON: FluentIcons.bookmark_24_filled,
  ),
  bookmarkAdd(
    mICON: CupertinoIcons.bookmark,
    wICON: FluentIcons.bookmark_add_24_regular,
  ),
  bookmarkAddFilled(
    mICON: CupertinoIcons.bookmark_fill,
    wICON: FluentIcons.bookmark_add_24_filled,
  ),
  bookmarkRemove(
    mICON: CupertinoIcons.bookmark,
    wICON: FluentIcons.bookmark_off_24_regular,
  ),
  briefcase(
    mICON: CupertinoIcons.briefcase,
    wICON: FluentIcons.briefcase_24_regular,
  ),
  calendar(
    mICON: CupertinoIcons.calendar,
    wICON: FluentIcons.calendar_ltr_24_regular,
  ),
  calendarFilled(
    mICON: CupertinoIcons.calendar,
    wICON: FluentIcons.calendar_ltr_24_filled,
  ),
  calendarAdd(
    mICON: CupertinoIcons.calendar_badge_plus,
    wICON: FluentIcons.calendar_add_24_regular,
  ),
  calendarAddFilled(
    mICON: CupertinoIcons.calendar_badge_plus,
    wICON: FluentIcons.calendar_add_24_filled,
  ),
  calenderRemove(
    mICON: CupertinoIcons.calendar_badge_minus,
    wICON: FluentIcons.calendar_cancel_24_regular,
  ),
  camera(
    mICON: CupertinoIcons.camera,
    wICON: FluentIcons.camera_24_regular,
  ),
  cameraFilled(
    mICON: CupertinoIcons.camera_fill,
    wICON: FluentIcons.camera_24_filled,
  ),
  cameraSwitch(
    mICON: CupertinoIcons.switch_camera,
    wICON: FluentIcons.camera_switch_24_regular,
  ),
  cameraSwitchFilled(
    mICON: CupertinoIcons.switch_camera,
    wICON: FluentIcons.camera_switch_24_filled,
  ),
  calenderRemoveFilled(
    mICON: CupertinoIcons.calendar_badge_minus,
    wICON: FluentIcons.calendar_cancel_24_filled,
  ),
  capslock(
    mICON: CupertinoIcons.capslock,
    wICON: FluentIcons.keyboard_shift_uppercase_24_regular,
  ),
  capslockFilled(
    mICON: CupertinoIcons.capslock_fill,
    wICON: FluentIcons.keyboard_shift_uppercase_24_filled,
  ),
  car(
    mICON: CupertinoIcons.car_detailed,
    wICON: FluentIcons.vehicle_car_24_regular,
  ),
  carFilled(
    mICON: CupertinoIcons.car_detailed,
    wICON: FluentIcons.vehicle_car_24_filled,
  ),
  cart(
    mICON: CupertinoIcons.cart,
    wICON: FluentIcons.cart_24_regular,
  ),
  cartFilled(
    mICON: CupertinoIcons.cart_fill,
    wICON: FluentIcons.cart_24_filled,
  ),
  cartAdd(
    mICON: CupertinoIcons.cart_badge_plus,
    wICON: FluentIcons.cart_24_regular,
  ),
  cartRemove(
    mICON: CupertinoIcons.cart_badge_minus,
    wICON: FluentIcons.cart_24_regular,
  ),
  chartBar(
    mICON: CupertinoIcons.chart_bar,
    wICON: FluentIcons.data_bar_vertical_24_regular,
  ),
  chartBarFilled(
    mICON: CupertinoIcons.chart_bar_fill,
    wICON: FluentIcons.data_bar_vertical_24_filled,
  ),
  chartPie(
    mICON: CupertinoIcons.chart_pie,
    wICON: FluentIcons.data_pie_24_regular,
  ),
  chartPieFilled(
    mICON: CupertinoIcons.chart_pie_fill,
    wICON: FluentIcons.data_pie_24_filled,
  ),
  chartLine(
    mICON: Icons.ssid_chart,
    wICON: FluentIcons.arrow_trending_24_regular,
  ),
  chartBubble(
    mICON: Icons.bubble_chart_outlined,
    wICON: FluentIcons.data_scatter_24_regular,
  ),
  bug(
    mICON: CupertinoIcons.ant,
    wICON: FluentIcons.bug_24_regular,
  ),
  bugFilled(
    mICON: CupertinoIcons.ant_fill,
    wICON: FluentIcons.bug_24_filled,
  ),
  chatBubble(
    mICON: CupertinoIcons.chat_bubble,
    wICON: FluentIcons.chat_24_regular,
  ),
  chatBubbleFilled(
    mICON: CupertinoIcons.chat_bubble_fill,
    wICON: FluentIcons.chat_24_filled,
  ),
  chatBubbleAdd(
    mICON: CupertinoIcons.chat_bubble_text,
    wICON: FluentIcons.chat_help_24_regular,
  ),
  checkMark(
    mICON: CupertinoIcons.check_mark,
    wICON: FluentIcons.checkmark_24_regular,
  ),
  checkMarkCircle(
    mICON: CupertinoIcons.checkmark_circle,
    wICON: FluentIcons.checkmark_circle_24_regular,
  ),
  checkMarkCircleFilled(
    mICON: CupertinoIcons.checkmark_circle_fill,
    wICON: FluentIcons.checkmark_circle_24_filled,
  ),
  checkMarkShield(
    mICON: CupertinoIcons.checkmark_shield,
    wICON: FluentIcons.shield_checkmark_24_regular,
  ),
  checkMarkShieldFilled(
    mICON: CupertinoIcons.checkmark_shield_fill,
    wICON: FluentIcons.shield_checkmark_24_filled,
  ),
  checkBoxEmpty(
    mICON: CupertinoIcons.square,
    wICON: FluentIcons.checkbox_unchecked_24_regular,
  ),
  checkBoxChecked(
    mICON: CupertinoIcons.checkmark_square,
    wICON: FluentIcons.checkbox_checked_24_regular,
  ),
  checkBoxCheckedFilled(
    mICON: CupertinoIcons.checkmark_square_fill,
    wICON: FluentIcons.checkbox_checked_24_filled,
  ),
  checkBoxIndeterminate(
    mICON: CupertinoIcons.minus_square,
    wICON: FluentIcons.checkbox_indeterminate_24_regular,
  ),
  circle(
    mICON: CupertinoIcons.circle,
    wICON: FluentIcons.circle_24_regular,
  ),
  circleFilled(
    mICON: CupertinoIcons.circle_fill,
    wICON: FluentIcons.circle_24_filled,
  ),
  circleHalf(
    mICON: CupertinoIcons.circle_lefthalf_fill,
    wICON: FluentIcons.circle_half_fill_24_regular,
  ),
  clear(
    mICON: CupertinoIcons.clear,
    wICON: FluentIcons.dismiss_24_regular,
  ),
  grid(
    mICON: CupertinoIcons.square_grid_2x2,
    wICON: FluentIcons.grid_24_regular,
  ),
  gridFilled(
    mICON: CupertinoIcons.square_grid_2x2_fill,
    wICON: FluentIcons.grid_24_filled,
  ),
  clock(
    mICON: CupertinoIcons.clock,
    wICON: FluentIcons.clock_24_regular,
  ),
  clockFilled(
    mICON: CupertinoIcons.clock_fill,
    wICON: FluentIcons.clock_24_filled,
  ),
  cloud(
    mICON: CupertinoIcons.cloud,
    wICON: FluentIcons.cloud_24_regular,
  ),
  cloudFilled(
    mICON: CupertinoIcons.cloud_fill,
    wICON: FluentIcons.cloud_24_filled,
  ),
  cloudDownload(
    mICON: CupertinoIcons.cloud_download,
    wICON: FluentIcons.cloud_arrow_down_24_regular,
  ),
  cloudDownloadFilled(
    mICON: CupertinoIcons.cloud_download_fill,
    wICON: FluentIcons.cloud_arrow_down_24_filled,
  ),
  cloudUpload(
    mICON: CupertinoIcons.cloud_upload,
    wICON: FluentIcons.cloud_arrow_up_24_regular,
  ),
  cloudUploadFilled(
    mICON: CupertinoIcons.cloud_upload_fill,
    wICON: FluentIcons.cloud_arrow_up_24_filled,
  ),
  cloudSync(
    mICON: CupertinoIcons.arrow_clockwise_circle,
    wICON: FluentIcons.cloud_sync_24_regular,
  ),
  cloudSyncFilled(
    mICON: CupertinoIcons.arrow_clockwise_circle_fill,
    wICON: FluentIcons.cloud_sync_24_filled,
  ),
  cloudError(
    mICON: CupertinoIcons.exclamationmark_circle,
    wICON: FluentIcons.cloud_error_24_regular,
  ),
  cloudErrorFilled(
    mICON: CupertinoIcons.exclamationmark_circle_fill,
    wICON: FluentIcons.cloud_error_24_filled,
  ),
  collection(
    mICON: CupertinoIcons.collections,
    wICON: FluentIcons.collections_24_regular,
  ),
  collectionFilled(
    mICON: CupertinoIcons.collections_solid,
    wICON: FluentIcons.collections_24_filled,
  ),
  compass(
    mICON: CupertinoIcons.compass,
    wICON: FluentIcons.compass_northwest_24_regular,
  ),
  creditCard(
    mICON: CupertinoIcons.creditcard,
    wICON: FluentIcons.credit_card_person_24_regular,
  ),
  creditCardFilled(
    mICON: CupertinoIcons.creditcard_fill,
    wICON: FluentIcons.credit_card_person_24_filled,
  ),
  crop(
    mICON: CupertinoIcons.crop,
    wICON: FluentIcons.crop_24_regular,
  ),
  delete(
    mICON: CupertinoIcons.delete,
    wICON: FluentIcons.delete_24_regular,
  ),
  deleteFilled(
    mICON: CupertinoIcons.delete_solid,
    wICON: FluentIcons.delete_24_filled,
  ),
  deviceDesktop(
    mICON: CupertinoIcons.desktopcomputer,
    wICON: FluentIcons.desktop_24_regular,
  ),
  deviceDesktopFilled(
    mICON: CupertinoIcons.desktopcomputer,
    wICON: FluentIcons.desktop_24_filled,
  ),
  deviceLaptop(
    mICON: CupertinoIcons.device_laptop,
    wICON: FluentIcons.laptop_24_regular,
  ),
  deviceLaptopFilled(
    mICON: CupertinoIcons.device_laptop,
    wICON: FluentIcons.laptop_24_filled,
  ),
  deviceMobile(
    mICON: CupertinoIcons.device_phone_portrait,
    wICON: FluentIcons.phone_24_regular,
  ),
  document(
    mICON: CupertinoIcons.doc,
    wICON: FluentIcons.document_24_regular,
  ),
  documentFilled(
    mICON: CupertinoIcons.doc_fill,
    wICON: FluentIcons.document_24_filled,
  ),
  documentChart(
    mICON: CupertinoIcons.doc_chart,
    wICON: FluentIcons.document_data_24_regular,
  ),
  documentChartFilled(
    mICON: CupertinoIcons.doc_chart_fill,
    wICON: FluentIcons.document_data_24_filled,
  ),
  documentCheck(
    mICON: CupertinoIcons.doc_checkmark,
    wICON: FluentIcons.document_checkmark_24_regular,
  ),
  documentCheckFilled(
    mICON: CupertinoIcons.doc_checkmark_fill,
    wICON: FluentIcons.document_checkmark_24_filled,
  ),
  documentCopy(
    mICON: CupertinoIcons.doc_on_clipboard,
    wICON: FluentIcons.document_copy_24_regular,
  ),
  documentCopyFilled(
    mICON: CupertinoIcons.doc_on_clipboard_fill,
    wICON: FluentIcons.document_copy_24_filled,
  ),
  documentPerson(
    mICON: CupertinoIcons.doc_person,
    wICON: FluentIcons.document_person_20_regular,
  ),
  documentPersonFilled(
    mICON: CupertinoIcons.doc_person_fill,
    wICON: FluentIcons.document_person_20_filled,
  ),
  documentSearch(
    mICON: CupertinoIcons.doc_text_search,
    wICON: FluentIcons.document_search_24_regular,
  ),
  drop(
    mICON: CupertinoIcons.drop,
    wICON: FluentIcons.drop_24_regular,
  ),
  dropFilled(
    mICON: CupertinoIcons.drop_fill,
    wICON: FluentIcons.drop_24_filled,
  ),
  edit(
    mICON: Icons.edit,
    wICON: FluentIcons.edit_24_regular,
  ),
  eject(
    mICON: CupertinoIcons.eject,
    wICON: FluentIcons.arrow_eject_20_regular,
  ),
  ejectFilled(
    mICON: CupertinoIcons.eject_fill,
    wICON: FluentIcons.arrow_eject_20_filled,
  ),
  ellipsesHoriz(
    mICON: CupertinoIcons.ellipsis,
    wICON: FluentIcons.more_horizontal_24_regular,
  ),
  ellipsesVert(
    mICON: CupertinoIcons.ellipsis_vertical,
    wICON: FluentIcons.more_vertical_24_regular,
  ),
  envelope(
    mICON: CupertinoIcons.envelope,
    wICON: FluentIcons.mail_24_regular,
  ),
  envelopeFilled(
    mICON: CupertinoIcons.envelope_fill,
    wICON: FluentIcons.mail_24_filled,
  ),
  envelopeOpen(
    mICON: CupertinoIcons.envelope_open,
    wICON: FluentIcons.mail_read_24_regular,
  ),
  envelopeOpenFilled(
    mICON: CupertinoIcons.envelope_open_fill,
    wICON: FluentIcons.mail_read_24_filled,
  ),
  envelopeBadge(
    mICON: CupertinoIcons.envelope_badge,
    wICON: FluentIcons.mail_unread_24_regular,
  ),
  eye(
    mICON: CupertinoIcons.eye,
    wICON: FluentIcons.eye_24_regular,
  ),
  eyeFilled(
    mICON: CupertinoIcons.eye_fill,
    wICON: FluentIcons.eye_24_filled,
  ),
  eyeOff(
    mICON: CupertinoIcons.eye_slash,
    wICON: FluentIcons.eye_off_24_regular,
  ),
  eyeOffFilled(
    mICON: CupertinoIcons.eye_slash_fill,
    wICON: FluentIcons.eye_off_24_filled,
  ),
  film(
    mICON: CupertinoIcons.film,
    wICON: FluentIcons.filmstrip_24_regular,
  ),
  filmFilled(
    mICON: CupertinoIcons.film_fill,
    wICON: FluentIcons.filmstrip_24_filled,
  ),
  flag(
    mICON: CupertinoIcons.flag,
    wICON: FluentIcons.flag_24_regular,
  ),
  flagFilled(
    mICON: CupertinoIcons.flag_fill,
    wICON: FluentIcons.flag_24_filled,
  ),
  folder(
    mICON: CupertinoIcons.folder,
    wICON: FluentIcons.folder_24_regular,
  ),
  folderFilled(
    mICON: CupertinoIcons.folder_fill,
    wICON: FluentIcons.folder_24_filled,
  ),
  folderAdd(
    mICON: CupertinoIcons.folder_badge_plus,
    wICON: FluentIcons.folder_add_24_regular,
  ),
  folderAddFilled(
    mICON: CupertinoIcons.folder_fill_badge_plus,
    wICON: FluentIcons.folder_add_24_filled,
  ),
  folderPerson(
    mICON: CupertinoIcons.folder_badge_person_crop,
    wICON: FluentIcons.folder_person_20_regular,
  ),
  folderPersonFilled(
    mICON: CupertinoIcons.folder_fill_badge_person_crop,
    wICON: FluentIcons.folder_person_20_filled,
  ),
  folderOpen(
    mICON: CupertinoIcons.folder_open,
    wICON: FluentIcons.folder_open_24_regular,
  ),
  folderOpenFilled(
    mICON: CupertinoIcons.folder_solid,
    wICON: FluentIcons.folder_open_24_filled,
  ),
  fullScreen(
    mICON: CupertinoIcons.fullscreen,
    wICON: FluentIcons.full_screen_maximize_24_regular,
  ),
  fullScreenExit(
    mICON: CupertinoIcons.fullscreen_exit,
    wICON: FluentIcons.full_screen_minimize_24_regular,
  ),
  gauge(
    mICON: CupertinoIcons.gauge,
    wICON: FluentIcons.gauge_24_regular,
  ),
  gaugeFilled(
    mICON: CupertinoIcons.gauge,
    wICON: FluentIcons.gauge_24_filled,
  ),
  gamecontroller(
    mICON: CupertinoIcons.game_controller,
    wICON: FluentIcons.games_24_regular,
  ),
  gamecontrollerFilled(
    mICON: CupertinoIcons.game_controller_solid,
    wICON: FluentIcons.games_24_filled,
  ),
  gear(
    mICON: CupertinoIcons.gear,
    wICON: FluentIcons.settings_24_regular,
  ),
  gearFilled(
    mICON: CupertinoIcons.gear_solid,
    wICON: FluentIcons.settings_24_filled,
  ),
  gift(
    mICON: CupertinoIcons.gift,
    wICON: FluentIcons.gift_24_regular,
  ),
  giftFilled(
    mICON: CupertinoIcons.gift_fill,
    wICON: FluentIcons.gift_24_filled,
  ),
  giftCard(
    mICON: CupertinoIcons.gift_alt,
    wICON: FluentIcons.gift_card_24_regular,
  ),
  giftCardFilled(
    mICON: CupertinoIcons.gift_alt_fill,
    wICON: FluentIcons.gift_card_24_filled,
  ),
  globe(
    mICON: CupertinoIcons.globe,
    wICON: FluentIcons.globe_24_regular,
  ),
  globeFilled(
    mICON: CupertinoIcons.globe,
    wICON: FluentIcons.globe_24_filled,
  ),
  group(
    mICON: CupertinoIcons.group,
    wICON: FluentIcons.people_24_regular,
  ),
  groupFilled(
    mICON: CupertinoIcons.group_solid,
    wICON: FluentIcons.people_24_filled,
  ),
  guitar(
    mICON: CupertinoIcons.guitars,
    wICON: FluentIcons.guitar_24_regular,
  ),
  thumbUp(
    mICON: CupertinoIcons.hand_thumbsup,
    wICON: FluentIcons.thumb_like_24_regular,
  ),
  thumbUpFilled(
    mICON: CupertinoIcons.hand_thumbsup_fill,
    wICON: FluentIcons.thumb_like_24_filled,
  ),
  thumbDown(
    mICON: CupertinoIcons.hand_thumbsdown,
    wICON: FluentIcons.thumb_dislike_24_regular,
  ),
  thumbDownFilled(
    mICON: CupertinoIcons.hand_thumbsdown_fill,
    wICON: FluentIcons.thumb_dislike_24_filled,
  ),
  headPhones(
    mICON: CupertinoIcons.headphones,
    wICON: FluentIcons.headphones_24_regular,
  ),
  headPhonesFilled(
    mICON: CupertinoIcons.headphones,
    wICON: FluentIcons.headphones_24_filled,
  ),
  heart(
    mICON: CupertinoIcons.heart,
    wICON: FluentIcons.heart_24_regular,
  ),
  heartFilled(
    mICON: CupertinoIcons.heart_fill,
    wICON: FluentIcons.heart_24_filled,
  ),
  heartBroken(
    mICON: CupertinoIcons.heart_slash,
    wICON: FluentIcons.heart_broken_24_regular,
  ),
  heartBrokenFilled(
    mICON: CupertinoIcons.heart_slash_fill,
    wICON: FluentIcons.heart_broken_24_filled,
  ),
  home(
    mICON: CupertinoIcons.house,
    wICON: FluentIcons.home_24_regular,
  ),
  homeFilled(
    mICON: CupertinoIcons.house_fill,
    wICON: FluentIcons.home_24_filled,
  ),
  info(
    mICON: CupertinoIcons.info_circle,
    wICON: FluentIcons.info_24_regular,
  ),
  infoFilled(
    mICON: CupertinoIcons.info_circle_fill,
    wICON: FluentIcons.info_24_filled,
  ),
  keyboard(
    mICON: CupertinoIcons.keyboard,
    wICON: FluentIcons.keyboard_24_regular,
  ),
  keyboardFilled(
    mICON: CupertinoIcons.keyboard,
    wICON: FluentIcons.keyboard_24_filled,
  ),
  language(
    mICON: Icons.language,
    wICON: FluentIcons.local_language_24_filled,
  ),
  lab(
    mICON: CupertinoIcons.lab_flask,
    wICON: FluentIcons.beaker_24_regular,
  ),
  labFilled(
    mICON: CupertinoIcons.lab_flask,
    wICON: FluentIcons.beaker_24_filled,
  ),
  layers(
    mICON: CupertinoIcons.layers,
    wICON: FluentIcons.layer_24_regular,
  ),
  layersFilled(
    mICON: CupertinoIcons.layers_fill,
    wICON: FluentIcons.layer_24_filled,
  ),
  lightBulb(
      mICON: CupertinoIcons.lightbulb, wICON: FluentIcons.lightbulb_24_regular),
  lightBulbFilled(
    mICON: CupertinoIcons.lightbulb_fill,
    wICON: FluentIcons.lightbulb_24_filled,
  ),
  link(
    mICON: CupertinoIcons.link,
    wICON: FluentIcons.link_24_regular,
  ),
  locationPin(
    mICON: CupertinoIcons.map_pin,
    wICON: FluentIcons.location_24_regular,
  ),
  locationPinFilled(
    mICON: CupertinoIcons.map_pin,
    wICON: FluentIcons.location_24_filled,
  ),
  locationArrowPin(
    mICON: CupertinoIcons.location,
    wICON: FluentIcons.location_arrow_24_regular,
  ),
  locationArrowPinFilled(
    mICON: CupertinoIcons.location_fill,
    wICON: FluentIcons.location_arrow_24_filled,
  ),
  lock(
    mICON: CupertinoIcons.lock,
    wICON: FluentIcons.lock_closed_24_regular,
  ),
  lockFilled(
    mICON: CupertinoIcons.lock_fill,
    wICON: FluentIcons.lock_closed_24_filled,
  ),
  lockOpen(
    mICON: CupertinoIcons.lock_open,
    wICON: FluentIcons.lock_open_24_regular,
  ),
  lockOpenFilled(
    mICON: CupertinoIcons.lock_open_fill,
    wICON: FluentIcons.lock_open_24_filled,
  ),
  map(
    mICON: CupertinoIcons.map,
    wICON: FluentIcons.map_24_regular,
  ),
  mapFilled(
    mICON: CupertinoIcons.map_fill,
    wICON: FluentIcons.map_24_filled,
  ),
  mic(
    mICON: CupertinoIcons.mic,
    wICON: FluentIcons.mic_24_regular,
  ),
  micFilled(
    mICON: CupertinoIcons.mic_fill,
    wICON: FluentIcons.mic_24_filled,
  ),
  micOff(
    mICON: CupertinoIcons.mic_slash,
    wICON: FluentIcons.mic_off_24_regular,
  ),
  micOffFilled(
    mICON: CupertinoIcons.mic_slash_fill,
    wICON: FluentIcons.mic_off_24_filled,
  ),
  moon(
    mICON: CupertinoIcons.moon,
    wICON: FluentIcons.weather_moon_24_regular,
  ),
  moonFilled(
    mICON: CupertinoIcons.moon_fill,
    wICON: FluentIcons.weather_moon_24_filled,
  ),
  move(
    mICON: CupertinoIcons.move,
    wICON: FluentIcons.arrow_move_24_regular,
  ),
  music(
    mICON: CupertinoIcons.music_note,
    wICON: FluentIcons.music_note_1_24_regular,
  ),
  musicFilled(
    mICON: CupertinoIcons.music_note,
    wICON: FluentIcons.music_note_1_24_filled,
  ),
  musicDouble(
    mICON: CupertinoIcons.music_note_2,
    wICON: FluentIcons.music_note_2_24_regular,
  ),
  musicDoubleFilled(
    mICON: CupertinoIcons.music_note_2,
    wICON: FluentIcons.music_note_2_24_filled,
  ),
  musicAlbum(
    mICON: CupertinoIcons.music_albums,
    wICON: FluentIcons.music_note_2_play_20_regular,
  ),
  musicAlbumFilled(
    mICON: CupertinoIcons.music_albums_fill,
    wICON: FluentIcons.music_note_2_play_20_filled,
  ),
  number(
    mICON: CupertinoIcons.number,
    wICON: FluentIcons.number_symbol_24_regular,
  ),
  paperclip(
    mICON: CupertinoIcons.paperclip,
    wICON: FluentIcons.attach_24_regular,
  ),
  paperplane(
    mICON: CupertinoIcons.paperplane,
    wICON: FluentIcons.send_24_regular,
  ),
  play(
    mICON: CupertinoIcons.play_arrow,
    wICON: FluentIcons.play_24_regular,
  ),
  playFilled(
    mICON: CupertinoIcons.play_fill,
    wICON: FluentIcons.play_24_filled,
  ),
  playCircle(
    mICON: CupertinoIcons.play_circle,
    wICON: FluentIcons.play_circle_24_regular,
  ),
  playCircleFilled(
    mICON: CupertinoIcons.play_circle_fill,
    wICON: FluentIcons.play_circle_24_filled,
  ),
  pause(
    mICON: CupertinoIcons.pause,
    wICON: FluentIcons.pause_24_regular,
  ),
  pauseFilled(
    mICON: CupertinoIcons.pause_fill,
    wICON: FluentIcons.pause_24_filled,
  ),
  pauseCircle(
    mICON: CupertinoIcons.pause_circle,
    wICON: FluentIcons.pause_circle_24_regular,
  ),
  pencil(
    mICON: CupertinoIcons.pencil,
    wICON: FluentIcons.edit_24_regular,
  ),
  pencilFilled(
    mICON: CupertinoIcons.pencil,
    wICON: FluentIcons.edit_24_filled,
  ),
  person(
    mICON: CupertinoIcons.person,
    wICON: FluentIcons.person_24_regular,
  ),
  personFilled(
    mICON: CupertinoIcons.person_fill,
    wICON: FluentIcons.person_24_filled,
  ),
  personTwo(
    mICON: CupertinoIcons.person_2,
    wICON: FluentIcons.people_24_regular,
  ),
  personTwoFilled(
    mICON: CupertinoIcons.person_2_fill,
    wICON: FluentIcons.people_24_filled,
  ),
  personThree(
    mICON: CupertinoIcons.person_3,
    wICON: FluentIcons.people_team_24_regular,
  ),
  personThreeFilled(
    mICON: CupertinoIcons.person_3_fill,
    wICON: FluentIcons.people_team_24_filled,
  ),
  personAdd(
    mICON: CupertinoIcons.person_add,
    wICON: FluentIcons.person_add_24_regular,
  ),
  personAddFilled(
    mICON: CupertinoIcons.person_add_solid,
    wICON: FluentIcons.person_add_24_filled,
  ),
  personRemove(
    mICON: CupertinoIcons.person_badge_minus,
    wICON: FluentIcons.person_delete_24_regular,
  ),
  personRemoveFilled(
    mICON: CupertinoIcons.person_badge_minus_fill,
    wICON: FluentIcons.person_delete_24_filled,
  ),
  personCircle(
    mICON: CupertinoIcons.person_crop_circle,
    wICON: FluentIcons.person_circle_24_regular,
  ),
  personCircleFilled(
    mICON: CupertinoIcons.person_crop_circle_fill,
    wICON: FluentIcons.person_circle_24_filled,
  ),
  personSquare(
    mICON: CupertinoIcons.person_crop_square,
    wICON: FluentIcons.person_square_24_regular,
  ),
  personSquareFilled(
    mICON: CupertinoIcons.person_crop_square_fill,
    wICON: FluentIcons.person_square_24_filled,
  ),
  phone(
    mICON: CupertinoIcons.phone,
    wICON: FluentIcons.call_24_regular,
  ),
  phoneFilled(
    mICON: CupertinoIcons.phone_fill,
    wICON: FluentIcons.call_24_filled,
  ),
  phoneAdd(
    mICON: CupertinoIcons.phone_badge_plus,
    wICON: FluentIcons.call_add_24_regular,
  ),
  phoneAddFilled(
    mICON: CupertinoIcons.phone_fill_badge_plus,
    wICON: FluentIcons.call_add_24_filled,
  ),
  phoneEnd(
    mICON: CupertinoIcons.phone_down,
    wICON: FluentIcons.call_end_24_regular,
  ),
  phoneEndFilled(
    mICON: CupertinoIcons.phone_down_fill,
    wICON: FluentIcons.call_end_24_filled,
  ),
  photo(
    mICON: CupertinoIcons.photo,
    wICON: FluentIcons.image_24_regular,
  ),
  photoFilled(
    mICON: CupertinoIcons.photo_fill,
    wICON: FluentIcons.image_24_filled,
  ),
  photoAlbum(
    mICON: CupertinoIcons.photo_on_rectangle,
    wICON: FluentIcons.image_multiple_24_regular,
  ),
  photoAlbumFilled(
    mICON: CupertinoIcons.photo_fill_on_rectangle_fill,
    wICON: FluentIcons.image_multiple_24_filled,
  ),
  piano(
    mICON: CupertinoIcons.piano,
    wICON: Icons.piano_outlined,
  ),
  pin(
    mICON: CupertinoIcons.pin,
    wICON: FluentIcons.pin_24_regular,
  ),
  pinFilled(
    mICON: CupertinoIcons.pin_fill,
    wICON: FluentIcons.pin_24_filled,
  ),
  power(
    mICON: CupertinoIcons.power,
    wICON: FluentIcons.power_24_regular,
  ),
  printer(
    mICON: CupertinoIcons.printer,
    wICON: FluentIcons.print_24_regular,
  ),
  printerFilled(
    mICON: CupertinoIcons.printer_fill,
    wICON: FluentIcons.print_24_filled,
  ),
  qrcode(
    mICON: CupertinoIcons.qrcode,
    wICON: FluentIcons.scan_qr_code_24_regular,
  ),
  rocket(
    mICON: CupertinoIcons.rocket,
    wICON: FluentIcons.rocket_24_regular,
  ),
  rocketFilled(
    mICON: CupertinoIcons.rocket_fill,
    wICON: FluentIcons.rocket_24_filled,
  ),
  rotateLeft(
    mICON: CupertinoIcons.rotate_left,
    wICON: FluentIcons.rotate_left_24_regular,
  ),
  rotateLeftFilled(
    mICON: CupertinoIcons.rotate_left_fill,
    wICON: FluentIcons.rotate_left_24_filled,
  ),
  rotateRight(
    mICON: CupertinoIcons.rotate_right,
    wICON: FluentIcons.rotate_right_24_regular,
  ),
  save(
    mICON: Icons.save,
    wICON: FluentIcons.save_24_regular,
  ),
  scissors(
    mICON: CupertinoIcons.scissors,
    wICON: FluentIcons.cut_24_regular,
  ),
  share(
    mICON: CupertinoIcons.share,
    wICON: FluentIcons.share_24_regular,
  ),
  shareFilled(
    mICON: CupertinoIcons.share_solid,
    wICON: FluentIcons.share_24_filled,
  ),
  shield(mICON: CupertinoIcons.shield, wICON: FluentIcons.shield_24_regular),
  shieldFilled(
    mICON: CupertinoIcons.shield_fill,
    wICON: FluentIcons.shield_24_filled,
  ),
  shift(
    mICON: CupertinoIcons.shift,
    wICON: FluentIcons.keyboard_shift_24_regular,
  ),
  shuffle(
      mICON: CupertinoIcons.shuffle,
      wICON: FluentIcons.arrow_shuffle_24_regular),
  signature(
    mICON: CupertinoIcons.signature,
    wICON: FluentIcons.signature_24_regular,
  ),
  speaker0(
    mICON: CupertinoIcons.speaker,
    wICON: FluentIcons.speaker_0_24_regular,
  ),
  speaker0Filled(
    mICON: CupertinoIcons.speaker_fill,
    wICON: FluentIcons.speaker_0_24_filled,
  ),
  speaker1(
    mICON: CupertinoIcons.speaker_1,
    wICON: FluentIcons.speaker_1_24_regular,
  ),
  speaker1Filled(
    mICON: CupertinoIcons.speaker_1_fill,
    wICON: FluentIcons.speaker_1_24_filled,
  ),
  speaker2(
    mICON: CupertinoIcons.speaker_2,
    wICON: FluentIcons.speaker_2_24_regular,
  ),
  speaker2Filled(
    mICON: CupertinoIcons.speaker_2_fill,
    wICON: FluentIcons.speaker_2_24_filled,
  ),
  speakerMute(
    mICON: CupertinoIcons.speaker_slash,
    wICON: FluentIcons.speaker_mute_24_regular,
  ),
  speakerMuteFilled(
    mICON: CupertinoIcons.speaker_slash_fill,
    wICON: FluentIcons.speaker_mute_24_filled,
  ),
  star(
    mICON: CupertinoIcons.star,
    wICON: FluentIcons.star_24_regular,
  ),
  starFilled(
    mICON: CupertinoIcons.star_fill,
    wICON: FluentIcons.star_24_filled,
  ),
  starHalf(
    mICON: CupertinoIcons.star_lefthalf_fill,
    wICON: FluentIcons.star_half_24_regular,
  ),
  starHalfFilled(
    mICON: CupertinoIcons.star_lefthalf_fill,
    wICON: FluentIcons.star_half_24_filled,
  ),
  starSlash(
    mICON: CupertinoIcons.star_slash,
    wICON: FluentIcons.star_off_24_regular,
  ),
  starSlashFilled(
    mICON: CupertinoIcons.star_slash_fill,
    wICON: FluentIcons.star_off_24_filled,
  ),
  stop(
    mICON: CupertinoIcons.stop,
    wICON: FluentIcons.stop_24_regular,
  ),
  stopFilled(
    mICON: CupertinoIcons.stop_fill,
    wICON: FluentIcons.stop_24_filled,
  ),
  table(
    mICON: CupertinoIcons.table,
    wICON: FluentIcons.table_24_regular,
  ),
  tableFilled(
    mICON: CupertinoIcons.table_fill,
    wICON: FluentIcons.table_24_filled,
  ),
  tag(
    mICON: CupertinoIcons.tag,
    wICON: FluentIcons.tag_24_regular,
  ),
  tagFilled(
    mICON: CupertinoIcons.tag_fill,
    wICON: FluentIcons.tag_24_filled,
  ),
  ticket(
    mICON: CupertinoIcons.ticket,
    wICON: FluentIcons.ticket_horizontal_24_regular,
  ),
  ticketFilled(
    mICON: CupertinoIcons.ticket_fill,
    wICON: FluentIcons.ticket_horizontal_24_filled,
  ),
  tv(
    mICON: CupertinoIcons.tv,
    wICON: FluentIcons.tv_24_regular,
  ),
  tvFilled(
    mICON: CupertinoIcons.tv_fill,
    wICON: FluentIcons.tv_24_filled,
  ),
  umbrella(
    mICON: CupertinoIcons.umbrella,
    wICON: FluentIcons.umbrella_24_regular,
  ),
  videoCamera(
    mICON: CupertinoIcons.videocam,
    wICON: FluentIcons.video_24_regular,
  ),
  videoCameraFilled(
    mICON: CupertinoIcons.videocam_fill,
    wICON: FluentIcons.video_24_filled,
  ),
  wand(
    mICON: CupertinoIcons.wand_stars,
    wICON: FluentIcons.wand_24_regular,
  ),
  wifi(
    mICON: CupertinoIcons.wifi,
    wICON: FluentIcons.wifi_1_24_regular,
  ),
  rotateRightFilled(
    mICON: CupertinoIcons.rotate_right_fill,
    wICON: FluentIcons.rotate_right_24_filled,
  ),
  removeFromBag(
    mICON: CupertinoIcons.bag_badge_minus,
    wICON: FluentIcons.shopping_bag_dismiss_24_regular,
  ),
  removeFromBagFilled(
    mICON: CupertinoIcons.bag_fill_badge_minus,
    wICON: FluentIcons.shopping_bag_dismiss_24_filled,
  ),
  download(
    mICON: CupertinoIcons.down_arrow,
    wICON: FluentIcons.arrow_download_24_regular,
  ),
  downloadFile(
    mICON: CupertinoIcons.arrow_down_doc,
    wICON: FluentIcons.document_arrow_left_24_regular,
  ),
  downloadFileFilled(
    mICON: CupertinoIcons.arrow_down_doc_fill,
    wICON: FluentIcons.document_arrow_left_24_filled,
  ),
  uploadFile(
    mICON: CupertinoIcons.arrow_up_doc,
    wICON: FluentIcons.document_arrow_right_24_regular,
  ),
  uploadFileFilled(
    mICON: CupertinoIcons.arrow_up_doc_fill,
    wICON: FluentIcons.document_arrow_right_24_filled,
  ),
  settings(
    mICON: CupertinoIcons.settings,
    wICON: FluentIcons.settings_24_regular,
  ),
  search(
    mICON: CupertinoIcons.search,
    wICON: FluentIcons.search_24_regular,
  ),
  verified(
    mICON: CupertinoIcons.checkmark_seal,
    wICON: FluentIcons.checkmark_starburst_24_regular,
  ),
  send(
    mICON: CupertinoIcons.paperplane,
    wICON: FluentIcons.send_24_regular,
  ),
  back(
    mICON: CupertinoIcons.back,
    wICON: FluentIcons.arrow_left_24_regular,
  ),
  forward(
    mICON: CupertinoIcons.forward,
    wICON: FluentIcons.arrow_right_24_regular,
  ),
  refresh(
    mICON: CupertinoIcons.refresh,
    wICON: FluentIcons.arrow_sync_24_regular,
  ),
  more(
    mICON: CupertinoIcons.ellipsis,
    wICON: FluentIcons.more_horizontal_24_regular,
  ),
  done(
    mICON: CupertinoIcons.check_mark,
    wICON: FluentIcons.checkmark_24_regular,
  ),
  zoomIn(
    mICON: CupertinoIcons.zoom_in,
    wICON: FluentIcons.zoom_in_24_regular,
  ),
  zoomOut(
    mICON: CupertinoIcons.zoom_out,
    wICON: FluentIcons.zoom_out_24_regular,
  );

  const AdpIcons({ required this.mICON, required this.wICON });

  final IconData mICON;
  final IconData wICON;
}

extension AdaptiveIconsEx on AdpIcons {
  IconData get platform => adaptiveValue<IconData>(
        macos: () => mICON,
        windows: () => wICON,
      );
}
