100.times do 
  Card.create(word: 'deepfave', definition: UrbanDictionary::get_top_definition('deepfave'))
end 

words = ['deepfave', 'craydar', 'tweleb', 'Snelfie', 'brotherzone', 'harassenger', 'wikipedant', 
         'gonser', 'whitespoken', 'textpergers', 'arhcivist', 'sharkology', 'mandate', 'twincrest',
         'selfiebombing', 'saltdaddy', 'lurper', 'twerking', 'stunning', 'trimmigrants', 'technocamping',
         'cyberbaiting', 'jeenyus', 'neckbeard', 'horsrus'
        ]