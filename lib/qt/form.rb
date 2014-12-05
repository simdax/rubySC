=begin
** Form generated from reading ui file 'form.ui'
**
** Created: ven. déc. 5 14:00:08 2014
**      by: Qt User Interface Compiler version 4.8.2
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
=end

class Ui_Form
    attr_reader :verticalSlider_5
    attr_reader :pushButton_3
    attr_reader :verticalSlider_6
    attr_reader :verticalSlider_2
    attr_reader :pushButton
    attr_reader :pushButton_2
    attr_reader :verticalSlider_7
    attr_reader :textEdit
    attr_reader :textBrowser
    attr_reader :verticalSlider
    attr_reader :lcdNumber

    def setupUi(form)
    if form.objectName.nil?
        form.objectName = "form"
    end
    form.resize(533, 477)
    @verticalSlider_5 = Qt::Slider.new(form)
    @verticalSlider_5.objectName = "verticalSlider_5"
    @verticalSlider_5.geometry = Qt::Rect.new(180, 110, 23, 160)
    @verticalSlider_5.maximum = 100
    @verticalSlider_5.singleStep = 1
    @verticalSlider_5.pageStep = 1
    @verticalSlider_5.orientation = Qt::Vertical
    @pushButton_3 = Qt::PushButton.new(form)
    @pushButton_3.objectName = "pushButton_3"
    @pushButton_3.geometry = Qt::Rect.new(400, 240, 95, 24)
    @pushButton_3.cursor = Qt::Cursor.new(Qt::PointingHandCursor)
    @pushButton_3.autoDefault = false
    @pushButton_3.default = false
    @verticalSlider_6 = Qt::Slider.new(form)
    @verticalSlider_6.objectName = "verticalSlider_6"
    @verticalSlider_6.geometry = Qt::Rect.new(320, 110, 23, 160)
    @verticalSlider_6.maximum = 100
    @verticalSlider_6.singleStep = 1
    @verticalSlider_6.pageStep = 1
    @verticalSlider_6.orientation = Qt::Vertical
    @verticalSlider_2 = Qt::Slider.new(form)
    @verticalSlider_2.objectName = "verticalSlider_2"
    @verticalSlider_2.geometry = Qt::Rect.new(110, 110, 23, 160)
    @verticalSlider_2.maximum = 100
    @verticalSlider_2.singleStep = 1
    @verticalSlider_2.pageStep = 1
    @verticalSlider_2.orientation = Qt::Vertical
    @pushButton = Qt::PushButton.new(form)
    @pushButton.objectName = "pushButton"
    @pushButton.geometry = Qt::Rect.new(400, 120, 95, 24)
    @pushButton_2 = Qt::PushButton.new(form)
    @pushButton_2.objectName = "pushButton_2"
    @pushButton_2.geometry = Qt::Rect.new(400, 150, 95, 24)
    @verticalSlider_7 = Qt::Slider.new(form)
    @verticalSlider_7.objectName = "verticalSlider_7"
    @verticalSlider_7.geometry = Qt::Rect.new(250, 110, 23, 160)
    @verticalSlider_7.maximum = 100
    @verticalSlider_7.singleStep = 1
    @verticalSlider_7.pageStep = 1
    @verticalSlider_7.orientation = Qt::Vertical
    @textEdit = Qt::TextEdit.new(form)
    @textEdit.objectName = "textEdit"
    @textEdit.geometry = Qt::Rect.new(20, 80, 71, 31)
    @textBrowser = Qt::TextBrowser.new(form)
    @textBrowser.objectName = "textBrowser"
    @textBrowser.geometry = Qt::Rect.new(50, 300, 451, 161)
    @verticalSlider = Qt::Slider.new(form)
    @verticalSlider.objectName = "verticalSlider"
    @verticalSlider.geometry = Qt::Rect.new(40, 110, 23, 160)
    @verticalSlider.maximum = 100
    @verticalSlider.singleStep = 1
    @verticalSlider.pageStep = 1
    @verticalSlider.orientation = Qt::Vertical
    @lcdNumber = Qt::LCDNumber.new(form)
    @lcdNumber.objectName = "lcdNumber"
    @lcdNumber.geometry = Qt::Rect.new(380, 20, 131, 71)

    retranslateUi(form)
    Qt::Object.connect(@verticalSlider, SIGNAL('valueChanged(int)'), @verticalSlider, SLOT('setValue(int)'))
    Qt::Object.connect(@verticalSlider, SIGNAL('valueChanged(int)'), @lcdNumber, SLOT('display(int)'))
    

    Qt::MetaObject.connectSlotsByName(form)
    end # setupUi

    def setup_ui(form)
        setupUi(form)
    end

    def retranslateUi(form)
    form.windowTitle = Qt::Application.translate("Form", "Form", nil, Qt::Application::UnicodeUTF8)
    @pushButton_3.text = Qt::Application.translate("Form", "Quit", nil, Qt::Application::UnicodeUTF8)
    @pushButton.text = Qt::Application.translate("Form", "play", nil, Qt::Application::UnicodeUTF8)
    @pushButton_2.text = Qt::Application.translate("Form", "stop", nil, Qt::Application::UnicodeUTF8)
    @textEdit.html = Qt::Application.translate("Form", "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n" \
"<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\n" \
"p, li { white-space: pre-wrap; }\n" \
"</style></head><body style=\" font-family:'Sans Serif'; font-size:9pt; font-weight:400; font-style:normal;\">\n" \
"<p align=\"center\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">TEMPO</p></body></html>", nil, Qt::Application::UnicodeUTF8)
    @textBrowser.html = Qt::Application.translate("Form", "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n" \
"<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\n" \
"p, li { white-space: pre-wrap; }\n" \
"</style></head><body style=\" font-family:'Sans Serif'; font-size:9pt; font-weight:400; font-style:normal;\">\n" \
"<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><br /></p></body></html>", nil, Qt::Application::UnicodeUTF8)
    end # retranslateUi

    def retranslate_ui(form)
        retranslateUi(form)
    end

end

module Ui
    class Form < Ui_Form
    end
end  # module Ui

