require 'rails_erd/diagram'

class YumlDiagram < RailsERD::Diagram

  setup do
    @edges = []
  end

  each_relationship do |relationship|
    line = if relationship.indirect? then "-.-" else "-" end
    
    arrow = case 
    when relationship.one_to_one?   then "1#{line}1>"
    when relationship.one_to_many?  then "1#{line}*>"
    when relationship.many_to_many? then "*#{line}*>"
    end

    @edges << "[#{relationship.source}] #{arrow} [#{relationship.destination}]"
  end

  save do
    puts @edges.join("\n")
  end
end

YumlDiagram.create