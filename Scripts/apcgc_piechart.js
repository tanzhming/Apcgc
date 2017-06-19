(function () {
    (function ($) {
        $.easyPieChart = function (el, options) {
            var drawLine, _this = this;
            this.el = el;
            this.$el = $(el);
            this.$el.data("easyPieChart", this);
            this.init = function () {
                var percent;
                _this.options = $.extend({}, $.easyPieChart.defaultOptions, options);
                percent = parseFloat(_this.$el.data('percent'));
                _this.percentage = 0;
                _this.canvas = $("<canvas width='" + _this.options.size + "' height='" + _this.options.size + "'></canvas>").get(0);
                _this.$el.append(_this.canvas);
                if (typeof G_vmlCanvasManager !== "undefined" && G_vmlCanvasManager !== null) {
                    G_vmlCanvasManager.initElement(_this.canvas);
                }
                _this.ctx = _this.canvas.getContext('2d');
                _this.ctx.translate(_this.options.size / 2, _this.options.size / 2);
                _this.$el.addClass('easyPieChart');
                _this.$el.css({
                    width: _this.options.size,
                    height: _this.options.size,
                    lineHeight: "" + _this.options.size + "px"
                });
                _this.update(percent);
                return _this;
            };
            this.update = function (percent) {
                return drawLine(percent);
            };
            drawLine = function (percent) {
                _this.ctx.fillStyle = _this.options.barColor_bg
                _this.ctx.save();
                _this.ctx.beginPath();
                _this.ctx.arc(0, 0, _this.options.size / 2, 0, Math.PI * 2, false);
                _this.ctx.fill();
                _this.ctx.restore();

                if (percent > 0.00 && percent < 100.00) {
                    _this.ctx.fillStyle = _this.options.barColor;
                    _this.ctx.save();
                    _this.ctx.beginPath();
                    _this.ctx.arc(0, 0, _this.options.size / 2, -Math.PI / 2, -Math.PI / 2 + Math.PI * 2 * percent / 100.00, false);
                    _this.ctx.lineTo(0, 0);
                    _this.ctx.fill();
                    _this.ctx.restore();
                }
                else if(percent == 100.00){
                    _this.ctx.fillStyle = _this.options.barColor;
                    _this.ctx.save();
                    _this.ctx.beginPath();
                    _this.ctx.arc(0, 0, _this.options.size / 2, 0, Math.PI * 2, false);
                    _this.ctx.lineTo(0, 0);
                    _this.ctx.fill();
                    _this.ctx.restore();
                }


                _this.ctx.fillStyle = _this.options.secColor_bg;
                _this.ctx.save();
                _this.ctx.beginPath();
                _this.ctx.arc(0, 0, _this.options.size / 2 - _this.options.lineWidth, 0, Math.PI * 2, false);
                _this.ctx.fill();
                _this.ctx.restore();

                if (percent > 0.00 && percent < 100.00) {
                    _this.ctx.fillStyle = _this.options.secColor;
                    _this.ctx.save();
                    _this.ctx.beginPath();
                    _this.ctx.arc(0, 0, _this.options.size / 2 - _this.options.lineWidth, -Math.PI / 2, -Math.PI / 2 + Math.PI * 2 * percent / 100.00, false);
                    _this.ctx.lineTo(0, 0);
                    _this.ctx.fill();
                    _this.ctx.restore();
                }
                else if (percent == 100.00) {
                    _this.ctx.fillStyle = _this.options.secColor;
                    _this.ctx.save();
                    _this.ctx.beginPath();
                    _this.ctx.arc(0, 0, _this.options.size / 2 - _this.options.lineWidth, 0, Math.PI * 2, false);
                    _this.ctx.lineTo(0, 0);
                    _this.ctx.fill();
                    _this.ctx.restore();
                }
                return true;
            };
            return this.init();
        };
        $.easyPieChart.defaultOptions = {
            barColor_bg: '#d0d0d0',
            barColor: '#f60',
            secColor_bg: '#ffffff',
            secColor: '#f3f3f3',
            lineCap: 'round',
            size: 100,
            lineWidth: 5,
            fontSize: '14px',
            fontColor: 'black',
            fontFamily: 'Helvetica',
            onStart: $.noop,
            onStop: $.noop
        };
        $.fn.easyPieChart = function (options) {
            return $.each(this, function (i, el) {
                var $el;
                $el = $(el);
                if (!$el.data('easyPieChart')) {
                    return $el.data('easyPieChart', new $.easyPieChart(el, options));
                }
            });
        };
        return void 0;
    })(jQuery);

}).call(this);
