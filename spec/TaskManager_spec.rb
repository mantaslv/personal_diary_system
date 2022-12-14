require "TaskManager"

RSpec.describe TaskManager do
    context "one task: " do
        task_manager = TaskManager.new

        it "adds task and returns helpful message" do
            result = task_manager.add("Walk dog")
            expect(result).to eq "Task was added: Walk dog"
        end

        it "lists task formatted nicely" do
            result = task_manager.list
            expect(result).to eq "These are your tasks: Walk dog."
        end

        it "complete and removes task and returns helpful message" do
            result = task_manager.complete("Walk dog")
            expect(result).to eq "Walk dog was completed and removed from your list."
        end

        it "returns helpful message when list is empty" do
            result = task_manager.list
            expect(result).to eq "You have no tasks to complete!"
        end
    end
end