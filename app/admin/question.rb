ActiveAdmin.register Question do

  form :partial => "form"
  
  controller do 
    def update
      question = Question.find(params["id"].to_i)
      unless params["question"]["choices"].first.last == ""
        new_choice = eval(params["question"]["choices"].first.last) 
        question.choices = new_choice
        question.save!
      end 
      params["question"].delete("choices")
    super
    end 
  end 
end 
