set run=python rabbitmqadmin

call:create_exchanges
call:create_queues
call:create_bindings
goto:eof

:create_queues - this procedure creates queues in RabbitMQ
  echo start creating queues
  %run% declare queue --vhost=pasha --user=guest --password=guest name=test_queue_1 durable=true 
  %run% declare queue --vhost=pasha --user=guest --password=guest name=test_queue_2 durable=true 
  goto:eof

:create_exchanges - this procedure creates exchanges in RabbitMQ
  echo start creating exchanges
  %run% declare exchange --vhost=pasha --user=guest --password=guest name=some_nice_topic_exchange type=topic durable=true
  %run% declare exchange --vhost=pasha --user=guest --password=guest name=even_more_nice_direct_exchange type=direct durable=true
  goto:eof

:create_bindings - this procedure creates bindings in RabbitMQ
  echo start creating bindings
  %run% declare binding --vhost=pasha --user=guest --password=guest source=some_nice_topic_exchange destination=test_queue_2 routing_key="lel"
  goto:eof
