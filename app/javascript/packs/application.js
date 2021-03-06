import "bootstrap";
import '../../stylesheets/application.scss'
import '../components/scroll.js';
import '../components/anchor.js';
import '../components/add-bin.js';
import '../components/dropable.js';
import '../components/array.js';
import "../plugins/flatpickr.js";
import '../components/trix_uploader.js';
import '../components/upload.js';

import Highcharts from "highcharts/highcharts.js";
import * as HighchartsMore from "highcharts/highcharts-more.js";
import "highcharts/css/highcharts.css";

HighchartsMore(Highcharts);
window.Highcharts = Highcharts;
