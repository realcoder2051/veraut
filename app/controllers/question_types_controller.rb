class QuestionTypesController < InheritedResources::Base

  private

    def question_type_params
      params.require(:question_type).permit(:name)
    end

end
