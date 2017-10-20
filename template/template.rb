class Report
  def initialize
    @title = 'Stock report'
    @text = ['Tech stocks are', 'surging significantly']
  end

  def output_report
    output_start
    output_head
    output_body_start
    @text.each { |line| output_line(line) }
    output_body_end
    output_end
  end

  def output_start
  end

  def output_head
    output_line(@title)
  end

  def output_body_start
  end

  def output_line(_line)
    raise 'Called abstract method: output_line'
  end

  def output_body_end
  end

  def output_end
  end
end

class HTMLReport < Report
  def output_start
    puts '<html>'
  end

  def output_head
    puts '  <head>'
    puts "    <title>#{@title}</title>"
    puts '  </head>'
  end

  def output_body_start
    puts '<body>'
  end

  def output_line(line)
    puts "  <p>#{line}</p>"
  end

  def output_body_end
    puts '</body>'
  end

  def output_end
    puts '</html>'
  end
end

class PlainTextReport < Report
  def output_start
  end

  def output_head
    puts "**** #{@title} ****"
    puts
  end

  def output_body_start
  end

  def output_line(line)
    puts line
  end

  def output_body_end
  end

  def output_end
  end
end

if __FILE__ == $0
  report = HTMLReport.new
  report.output_report

  report = PlainTextReport.new
  report .output_report
end