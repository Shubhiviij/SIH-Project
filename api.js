import axios from "axios";

const API_URL = "http://localhost:5000/api/issues"; // backend URL

export const getIssues = async () => {
  try {
    const response = await axios.get(API_URL);
    return response.data;
  } catch (error) {
    console.error("Error fetching issues:", error);
    return [];
  }
};

export const createIssue = async (issue) => {
  try {
    const response = await axios.post(API_URL, issue);
    return response.data;
  } catch (error) {
    console.error("Error creating issue:", error);
  }
};
