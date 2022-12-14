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

    context "two tasks: " do
        task_manager = TaskManager.new

        it "adds two tasks and returns list" do
            task_manager.add("Walk dog")
            task_manager.add("Water plants")
            result = task_manager.list
            expect(result).to eq "These are your tasks: Walk dog, Water plants."
        end

        it "complete and removes task and returns updated list" do
            task_manager.complete("Walk dog")
            result = task_manager.list
            expect(result).to eq "These are your tasks: Water plants."
        end
    end

    it "tries to complete and remove task that does not exist and returns message to say so" do
        task_manager = TaskManager.new
        task_manager.add("Walk dog")
        result = task_manager.complete("Water plants")
        expect(result).to eq "Water plants is not in your tasks."
    end

    context "it fails if" do
        task_manager = TaskManager.new
        
        it "tries to add a task which is not a string" do
            expect{ task_manager.add(true) }.to raise_error "Please enter text only!"
        end

        it "tries to add a task which is empty" do
            expect{ task_manager.add("") }.to raise_error "Please enter some text!"
        end

        it "tries to add a task which is empty" do
            expect{ task_manager.add("     ") }.to raise_error "Please enter some text!"
        end
    end
end