library co.com.countries.home;

import 'dart:convert';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

part 'screen/home_screen.dart';
part 'screen/home_detail_country_screen.dart';
part 'screen/home_comparison_screen.dart';
part 'model/model_country.dart';
part 'model/model_region.dart';
part 'model/model_population.dart';
part 'service/home_service.dart';
part 'viewmodel/home_viewmodel.dart';
part 'screen/widgets/countries_tab.dart';
part 'screen/widgets/country_card.dart';
part 'screen/widgets/tab_bar_custom.dart';
