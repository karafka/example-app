# frozen_string_literal: true

# Service gor logging params to file
class LoggerService
  # @param consumer [Karafka::BaseConsumer instance]
  # @param path [String] path to file
  def write_to_file(consumer, path)
    file = File.open(path, 'a+')
    file.write "Consumer topic details: #{consumer.topic.to_h}\n"
    file.close
  end

  # Clears all data from log file
  # @param path [String] path to file
  def clear_file(path)
    File.open(path, 'w') {}
  end
end
