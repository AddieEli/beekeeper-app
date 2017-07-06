document.addEventListener("DOMContentLoaded", function(event) { 
  var app = new Vue({
    el: '#app',
    data: {
      message: 'Hello Vue!'
    },
    mounted: function() {

      google.charts.load('current', {packages:["orgchart"]});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'hive_id');
        data.addColumn('string', 'parent_id');

        // For each orgchart box, provide the name, manager, and tooltip to show.
        data.addRows([
          [{v:'', 
            f:'Mike<div style="color:red; font-style:italic"> TEST TEST </div>'},
           '', 'The President'],
          [{v:'Jim', 
            f:'Jim<div style="color:red; font-style:italic">Vice President</div>'},
           'Mike', 'VP'],
          ['Alice', 'Mike', ''],
          ['Bob', 'Jim', 'Bob Sponge'],
          ['Carol', 'Bob', '']
        ]);

        // Create the chart.
        var chart = new google.visualization.OrgChart(document.getElementById('chart_div'));
        // Draw the chart, setting the allowHtml option to true for the tooltips.
        chart.draw(data, {allowHtml:true});
      }
    }.bind(google)
  });
});

