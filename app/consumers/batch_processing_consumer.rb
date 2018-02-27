# frozen_string_literal: true

# This consumer receives a batch of messages at once (not a single message)
# You can use it to process multiple messages at  the same time, for example
# for batch inserting ito database, etc
# The batch is accessible using the #params_batch method
class BatchProcessingConsumer < ApplicationConsumer
  # Performs business logic with messages batch
  def consume
    # You can access the params_batch as an array and just work with it
    sum = params_batch.map { |param| param[:number] }.sum
    # Then you can do anything with that sum
    puts "We've got sum of #{params_batch.count} elements equal: #{sum}\n"

    LoggerService.new.write_to_file(
      self,
      File.join(Karafka::App.root, 'log', 'batch_processing_consumer.log')
    )
  end
end
