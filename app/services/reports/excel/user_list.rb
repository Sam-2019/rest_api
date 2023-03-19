# frozen_string_literal: true

module Reports
  module Excel
    class UserList < Reports::Excel::Base
      def generate
        file = "#{SPREADSHEET_DOWNLOAD_FOLDER}/users_list.xlsx"

        unless FileTest.exist?(file.to_s)
          users_list
          @document.serialize file.to_s
        end
      end

      def users_list
        Rails.logger.debug "Demigod"
        @document.workbook.add_worksheet(name: "Users") do |sheet|
          header = ["ID", "First Name", "Last Name", "Email", "State"]
          sheet.add_row header, style: Axlsx::STYLE_THIN_BORDER

          User.all.each do |user|
            values = [user.id, user.first_name, user.last_name, user.email,
              user.state].to_a
            sheet.add_row values
          end

          column_count = User.count + 1
          sheet.auto_filter = "A1:E#{column_count}"

          sheet.sheet_view.pane do |pane|
            pane.top_left_cell = "B2"
            pane.state = :frozen_split
            pane.y_split = 1
            pane.x_split = 1
            pane.active_pane = :bottom_right
          end
        end
      end
    end
  end
end
